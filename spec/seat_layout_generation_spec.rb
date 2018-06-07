RSpec.describe SeatLayoutGeneration do

	context "Input Validations" do
	end

	context "Build Seat layout input as [[2,3]]" do
		before(:all) do
		 @seat = SeatLayoutGeneration.new([[2,3]])
		 @seat.process
		end
		
		it "should have 6 window seats" do
			expect(@seat.layout[0].total_window_seats).to eq(6)
		end

		it "should d't have any asile seat" do
			expect(@seat.layout[0].total_middle_seats).to eq(0)
		end

		it "should d't have any asile seat" do
			expect(@seat.layout[0].total_asile_seats).to eq(0)
		end

		it "should have only one layout column" do
			expect(@seat.layout.length).to eq(1)
	  end

    it "should have max value row 2 and column 3" do
      expect(@seat.max_length_of_layout_column).to eq(3)
      expect(@seat.max_length_of_layout_row).to eq(2)
    end

  end

  context "Build Seat layout input as [[2,3],[3,4]]" do
  	before(:all) do
		 @seat = SeatLayoutGeneration.new([[2,3],[3,4]])
		 @seat.process
		end
		
		it "should have 3 window seats in first layout column and 4 in 2nd layout column" do
			expect(@seat.layout[0].total_window_seats).to eq(3)
			expect(@seat.layout[1].total_window_seats).to eq(4)
		end

		it "should have 0 middle seats in first layout column and 4 in 2nd layout column" do
			expect(@seat.layout[0].total_middle_seats).to eq(0)
			expect(@seat.layout[1].total_middle_seats).to eq(4)
		end

		it "should have 3 asile seats in first layout column and 4 in 2nd layout column" do
			expect(@seat.layout[0].total_asile_seats).to eq(3)
			expect(@seat.layout[1].total_asile_seats).to eq(4)
		end

		it "should have two layout columns" do
			expect(@seat.layout.length).to eq(2)
	  end

    it "should have max value row 3 and column 4" do
      expect(@seat.max_length_of_layout_column).to eq(4)
      expect(@seat.max_length_of_layout_row).to eq(3)
    end

  end

  context "Build Seat layout input as [[2,3],[2,2],[2,3]]" do
  	 before(:all) do
			 @seat = SeatLayoutGeneration.new([[2,3],[2,2],[2,3]])
			 @seat.process
		end
		
		it "should have 3,0,3 window seats" do
			expect(@seat.layout[0].total_window_seats).to eq(3)
			expect(@seat.layout[1].total_window_seats).to eq(0)
			expect(@seat.layout[2].total_window_seats).to eq(3)
		end

		it "should have 0,0,0 middle seats" do
			expect(@seat.layout[0].total_middle_seats).to eq(0)
			expect(@seat.layout[1].total_middle_seats).to eq(0)
			expect(@seat.layout[2].total_middle_seats).to eq(0)
		end

		it "should have 3,4,3 asile seat" do
			expect(@seat.layout[0].total_asile_seats).to eq(3)
			expect(@seat.layout[1].total_asile_seats).to eq(4)
			expect(@seat.layout[2].total_asile_seats).to eq(3)
		end

		it "order value check" do
			expect(@seat.layout[0].order).to eq(1)
			expect(@seat.layout[1].order).to eq(2)
			expect(@seat.layout[2].order).to eq(3)
	  end

		it "should have 3 layout columns" do
			expect(@seat.layout.length).to eq(3)
	  end

    it "should have max value row 2 and column 3" do
      expect(@seat.max_length_of_layout_column).to eq(3)
      expect(@seat.max_length_of_layout_row).to eq(2)
    end

  end

end