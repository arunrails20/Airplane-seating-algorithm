RSpec.describe SeatFilling do
	context "Build Seat layout input as [[3,2], [4,3],[2,3],[3,4]], number of passenger in Q(60) are greater than available seats" do
  	before(:all) do
    	@seat = SeatLayoutGeneration.new([ [3,2],  [4,3],  [2,3],  [3,4] ])
    	@seat.process
      @seat.total_seats
      @number_of_passenger_in_q = 60
      SeatFilling.new(@number_of_passenger_in_q,@seat).process
  	end

    it "should have total 36 sheets and remaining number of passenger in Q is  24" do
      expect(@seat.total_seats).to eq(36)
      expect(@number_of_passenger_in_q - @seat.total_seats).to eq(24)
    end

	end

  context "Build Seat layout input as [[3,2],[4,3],[3,4]], number of passenger in Q(15) are less than available seats" do
    before(:all) do
      @seat = SeatLayoutGeneration.new([ [3,2],[4,3],[3,4] ])
      @seat.process
      @number_of_passenger_in_q = 15
      SeatFilling.new(@number_of_passenger_in_q,@seat).process
    end

    it "should have total 30 sheets and remaining available sheets is 15" do
      expect(@seat.total_seats).to eq(30)
      expect(@seat.total_seats - @number_of_passenger_in_q).to eq(15)
    end
  end

  context "Build Seat layout input as [[6,2],[4,3],[3,4]], number of passenger in Q(36) are equal to available seats" do
     before(:all) do
      @seat = SeatLayoutGeneration.new([ [6,2],[4,3],[3,4] ])
      @seat.process
      @number_of_passenger_in_q = 36
      SeatFilling.new(@number_of_passenger_in_q,@seat).process
    end

    it "should have total 30 sheets and remaining available sheets is 36" do
      expect(@seat.total_seats).to eq(36)
      expect(@seat.total_seats - @number_of_passenger_in_q).to eq(0)
    end
  end

end