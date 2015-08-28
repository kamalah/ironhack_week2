require_relative "../ruby_files/cell.rb"
require_relative "../ruby_files/grid.rb"

RSpec.describe Grid do
	describe "2x2 board" do
		it "flip status" do
	 	    grid = Grid.new(2)
	        grid.board = [[1,0],
						  [0,1]]
	        expect(grid.update_board).to eq([[0,1],[1,0]])
	    end

	    it "Live become dead" do
	 	    grid = Grid.new(2)
	        grid.board = [[0,1],
						  [0,1]]
	        expect(grid.update_board).to eq([[1,0],[1,0]])
	    end

	end

	describe "3x3 board" do
	   	it "checks larger board state" do
	     	grid = Grid.new(3)
	        grid.board = [	[1,1,0],
					  		[1,0,0],
					  		[0,0,0]]				  	
	         expect(grid.update_board).to eq([[1,1,0],[1,1,0],[0,0,0]])
	    end
	end

	it "checks 5x5" do
		grid = Grid.new(5)
        grid.board = [	[1,0,0,0,0],
				  		[0,0,1,0,0],	
				  		[0,0,0,0,0],
				  		[0,0,0,1,0],
				  		[0,0,1,0,0]]				 
         expect(grid.update_board).to eq([[0,1,0,0,0],[0,1,0,0,0],[0,0,1,1,0],[0,0,1,0,0],[0,0,0,1,0]])
      end
end

 