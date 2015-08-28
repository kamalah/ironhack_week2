require_relative "cell.rb"
require "pry"

class Grid
	attr_accessor :board, :size
	def initialize (size)
		@size = size
		@board = []
		create_triangle_middle_board(4)
	end
	
	def create_board
		@board = Array.new(@size) {Array.new(@size)}
		@board.each_with_index do |each_row,y|
			each_row.each_with_index do |cell,x|
				@board[y][x] = [0,0,1].sample
			end
		end

	end

	def create_corners_board(square_size)
		@board = Array.new(@size) {Array.new(@size, 0)}
		create_squares(square_size,0,0)
		create_squares(square_size,0, @size- square_size)
		create_squares(square_size,@size- square_size,0)
		create_squares(square_size,@size- square_size, @size- square_size)
	end

	def create_square_middle_board(square_size)
		@board = Array.new(@size) {Array.new(@size, 0)}
		create_squares(square_size, (@size-square_size)/2, (@size-square_size)/2)
	end

	def create_squares(size,x,y)
		#start in upper left corner
		y.upto(y+size-1) do |y_index|
			x.upto(x+size-1) do |x_index|
				@board[y_index][x_index] = 1
			end
		end

	end

	def create_triangle_middle_board(rows)
		@board = Array.new(@size) {Array.new(@size, 0)}

		middle_of_board = (@size)/2
		top_of_triangle = (@size-rows)/2
			0.upto(rows-1) do |y_index|
				1.upto(y_index*2+1) do |x_index|
					start_x = middle_of_board-(y_index)
					@board[top_of_triangle+y_index][start_x+x_index-1] = 1
			end
		end

	end

	def update_board
		new_board =Array.new(@size) {Array.new(@size)}
		@board.each_with_index do |each_row,y|
			each_row.each_with_index do |cell,x|
				status_array =[]
				status_array << (each_row[x+1].nil? ? 0 : each_row[x+1])
				status_array << (x== 0 ? 0 : each_row[x-1])
		
				if y > 0
					row_above = @board[y-1]
					status_array += check_row(row_above,x)
				end

				if y < @board.size-1
					row_below = @board[y+1]
					status_array += check_row(row_below,x)
				end
				new_board[y][x] = Cell.new(cell, status_array).regenerate  
				end
		end
		@board = new_board
	end

	def check_row(row_array, x)
			row_status = []
			row_status << (row_array[x+1].nil? ? 0 : row_array[x+1])
			row_status << (x == 0 ? 0 : row_array[x-1])
			row_status << row_array[x]
	end		

	def print_board
		@board.each_with_index do |each_row,y|
			each_row.each_with_index do |cell,x|
			if cell == 1
				print "X"
			else
				print " "
			end
		end
		puts ""
	end
end

	def play_game
		time = Time.now

		while (Time.now-time < 15)
			update_board
			system "clear"
			print_board
			sleep(0.5)
		end
	
	end	

end

my_grid = Grid.new(9)
#print my_grid.board
my_grid.play_game