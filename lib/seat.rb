class Seat
	attr_accessor :type, :passenger_number, :row, :column

	def initialize type, passenger_number, row, column
		@type = type
		@passenger_number = passenger_number
		@row = row
		@column = column
	end
end