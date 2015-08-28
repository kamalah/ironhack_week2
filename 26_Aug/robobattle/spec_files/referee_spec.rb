require "rspec"
require_relative "../ruby_files/referee.rb"
require_relative "../ruby_files/robot.rb"


RSpec.describe RoboContender do 
	before :each do
	 	@ref = Referee.new
	  	@player1 = RoboContender.new("player1")
	  	@player2 = RoboContender.new("player2")
	end

	describe "#both weak, damage null" do
	 	it "Both weak, damage null (player1)." do
	 		@player1.move = "weak"
	 		@player2.move = "weak"
	 		@ref.attack(@player1, @player2)
	 		expect(@player1.strength).to eq(100)
	  	end

	 	it "Both weak, damage null (player2)." do
	 		@player1.move = "weak"
	 		@player2.move = "weak"
	 		@ref.attack(@player1, @player2)
	 		expect(@player2.strength).to eq(100)
	  	end
	end
  
  	describe "#both strong, damage double" do
	 	it "Both strong, damage double (player1)." do
	 		@player1.move = "strong"
	 		@player2.move = "strong"
	 		@ref.attack(@player1, @player2)
	 		expect(@player1.strength).to eq(60)
	  	end

	 	it "Both strong, damage double (player2)." do
	 		@player1.move = "strong"
	 		@player2.move = "strong"
	 		@ref.attack(@player1, @player2)
	 		expect(@player2.strength).to eq(60)
	  	end
	end

	describe "#both definitive, both lose" do
	 	it "Both definitive, both lose (player1)." do
	 		@player1.move = "definitive"
	 		@player2.move = "definitive"
	 		@ref.attack(@player1, @player2)
	 		expect(@player1.strength).to eq(0)
	  	end

	 	it "Both definitive, both lose (player2)." do
	 		@player1.move = "definitive"
	 		@player2.move = "definitive"
	 		@ref.attack(@player1, @player2)
	 		expect(@player2.strength).to eq(0)
	  	end
	end

 	describe "#definitive and weak, weak wins" do
	 	it "#definitive and weak, weak wins(player1)" do
	 		@player1.move = "weak"
	 		@player2.move = "definitive"
	 		@ref.attack(@player1, @player2)
	 		expect(@player2.strength).to eq(90)
	  	end

	 	it "#definitive and weak, weak wins(player2)" do
	 		@player1.move = "definitive"
	 		@player2.move = "weak"
	 		@ref.attack(@player1, @player2)
	 		expect(@player1.strength).to eq(90)
	  	end
	end
end