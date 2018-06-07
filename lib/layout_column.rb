# LayoutColumn has many Seat objects
class LayoutColumn
	attr_accessor :val, :result, :order, :first_layout_row, :last_layout_row

	def initialize val, order, first_layout_row, last_layout_row
		@val = val
		@result = []
		@order = order
		@first_layout_row = first_layout_row
		@last_layout_row = last_layout_row
		build_row_set
	end

	AppConstant::TYPES_OF_SEATES.keys.each do |key|
		define_method("total_#{key}_seats") do ||
			result.flatten.group_by{ |s| s.type }[key].count rescue 0
		end
	end

	def build_row_set
		row_val = val[1]
		column_val =  val[0]
		(0..row_val - 1).inject(result) do |result,i|
			row = (0..column_val - 1).each_with_index.inject([])  do |acc, (j,index)|
						seat_creation acc,i,j,column_val,index
					end
			result.push row
		end
	end

	def seat_creation acc,i,j,column_val,index
		acc.push(Seat.new(seat_type(index, column_val),nil,i,j))
	end

	def seat_type index, length
		if window_seat? index, length
			AppConstant::TYPES_OF_SEATES["window"]
		elsif asile_seat? index, length
			AppConstant::TYPES_OF_SEATES["asile"]
		else
			AppConstant::TYPES_OF_SEATES["middle"]
		end
	end

	def asile_seat? index, length
		index.first_index? || length == 2 || index.last_index?(length)
	end

	def window_seat? index, length
		(first_layout_row && index.first_index?) || (last_layout_row && index.last_index?(length) )
	end
end