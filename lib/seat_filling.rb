class SeatFilling
	attr_accessor :number_of_passenger, :seat_layout

	def initialize number_of_passenger, seat_layout
		@number_of_passenger = number_of_passenger
		@seat_layout = seat_layout
	end

	def process
    total_remaining_seats
  end

  def total_remaining_seats
    remaing_seats = asile_seats_filling
    remaing_seats = window_seats_filling(remaing_seats) if remaing_seats
    remaing_seats = middle_seats_filling(remaing_seats) if remaing_seats
    remaing_seats
  end

  def asile_seats_filling
    seat_allocation 1, AppConstant::TYPES_OF_SEATES["asile"]
  end

  def window_seats_filling remaing_seats
    seat_allocation remaing_seats, AppConstant::TYPES_OF_SEATES["window"]
  end

  def middle_seats_filling remaing_seats
    seat_allocation remaing_seats, AppConstant::TYPES_OF_SEATES["middle"]
  end

  private

  def seat_allocation(i,seat_type)
    (0..seat_layout.max_length_of_layout_row-1).each do |row|
      (0..seat_layout.layout.length-1).each do |j|
        seat = seat_layout.layout[j].result[row].select {|a| a.type == seat_type and a.passenger_number.nil? } rescue nil
        return i if i > number_of_passenger
        if seat
          seat.each do |s|
            return i if i > number_of_passenger
            s.passenger_number = i 
            i += 1
         end
        end
      end
    end
    return i 
	end

end