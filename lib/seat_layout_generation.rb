# SeatLayoutGeneration class has many LayoutColumns

class SeatLayoutGeneration
	attr_accessor :input, :layout, :errors

	def initialize input
		@input = input
		@layout = []
		@errors = []
    validation
	end

	def process
    return false if !errors.empty?
		order = 0
		input.each_with_index do |val,index|
			order += 1
			layout_row = LayoutColumn.new(val,order, first_layout_row?(index), last_layout_row?(index))
			layout.push(layout_row)
		end
    return true
	end

  def validation
    @errors.push("Invaild 2D array input") if !is_valid_two_d_array?
  end

  def total_seats
    layout.map{|row| row.result }.flatten.count
  end

	def print
		layout.each do |layout_row|
      puts ""
			layout_row.result.each do |obj|
        puts obj.map{|a| [a.type, a.passenger_number, "|"]}.join(" ")
			end
		end
	end

	def first_layout_row? index
		index.first_index?
	end

	def last_layout_row? index
		index.last_index?(input.length)
	end

  def max_length_of_layout_column
    get_max_value(1)
  end

  def max_length_of_layout_row
    get_max_value(0)
  end

  def get_max_value(i)
    input.inject([]) {|acc,ele| acc << ele[i]}.max
  end

  private

  def is_valid_two_d_array?
    result = true
    input.each do |i|
      return false if i.length != 2
      i.each do |a|
        return false if a == 0
      end
    end
    return result
    rescue Exception => e 
     p e
     retrun false 
  end

end
