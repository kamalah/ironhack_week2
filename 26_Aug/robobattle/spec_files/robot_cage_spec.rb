require "rspec"
require_relative "../ruby_files/referee.rb"
require_relative "../ruby_files/robot.rb"
require_relative "../ruby_files/robot_cage.rb"

RSpec.describe RoboCage do 
	before :each do
	  	@player1 = RoboContender.new("player1")
	  	@player2 = RoboContender.new("player2")
	  	@ref = Referee.new
	end

	describe "game status" do 
		it "Check if game is over with player 1 winning" do
			@player1.strength = 100
			@player2.strength = 0
			cage = RoboCage.new(@player1, @player2,@ref)
			expect(cage.winner).to eq("player1")
		end

		it "Check if game is over with player 2 winning" do
			@player1.strength = 0
			@player2.strength = 100
			cage = RoboCage.new(@player1, @player2,@ref)
			expect(cage.winner).to eq("player2")
		end

		it "Check if no winner" do
			@player1.strength = 50
			@player2.strength = 100
			cage = RoboCage.new(@player1, @player2,@ref)
			expect(cage.winner).to be_falsey
		end

		it "Checks who's winning player1" do
			@player1.strength = 90
			@player2.strength = 50
			cage = RoboCage.new(@player1, @player2,@ref)
			expect(cage.winning).to eq("player1")
		end

		it "Checks who's winning player2" do
			@player1.strength = 90
			@player2.strength = 100
			cage = RoboCage.new(@player1, @player2,@ref)
			expect(cage.winning).to eq("player2")
		end
	end

	describe "game play" do

	end

end