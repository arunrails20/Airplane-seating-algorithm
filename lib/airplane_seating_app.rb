require "bundler/setup"
require "airplane_seating_app/version"
require "app_constant"
require "seat_layout_generation"
require "seat_filling"
require "layout_column"
require "seat"
require "utility/integer"


module AirplaneSeatingApp
  def self.process input
    puts "Enter Number of passengers are waiting in  queue"
    number_of_passenger_in_q = gets.chomp.to_i
    seat = SeatLayoutGeneration.new(input)
    if seat.process
      puts "=========================================="
      SeatFilling.new(number_of_passenger_in_q,seat).process
      puts "Seat Layout Structure after Filling"
      puts "Seat Format is seat name(window,middle asile) and passenger number"
      seat.print
    else
      puts "======Errors============"
      p seat.errors
    end
  end

end

input_datas = []
puts "For exit enter empty value, Row and column are required to build 2D input"
puts "All values are integers"
puts "You can enter multiple row and column"
loop do
  array = []
  puts "Enter column"
  column = gets.chomp
  break if column == ""
  puts "Enter row"
  row = gets.chomp
  break if row == ""
  input_datas.push( array.push(column.to_i,row.to_i))
end

puts "Your 2D array input"
p input_datas

AirplaneSeatingApp::process input_datas