require_relative "../ruby_files/referee.rb"
require_relative "../ruby_files/robot.rb"

class RoboCage
	def initialize(player1, player2, ref)
		@player1 = player1
		@player2 = player2
		@ref = ref
	end

	def winner
		if @player1.strength <= 0 || @player2.strength <= 0 
			winning
		else
			false
		end 
	end

	def winning
		if @player1.strength == @player2.strength
			"Tie"
		else
			@player1.strength > @player2.strength ? @player1.name : @player2.name
		end
	end

	def status
		puts "#{@player1.name}: #{@player1.strength}"
		puts "#{@player2.name}: #{@player2.strength}"
	end
	
	def auto_play_game
		valid_moves =["definitive","weak","strong"]
		while !winner
			puts @player1.move = valid_moves.sample
			puts @player2.move = valid_moves.sample
			@ref.attack(@player1, @player2)
			status			
		end
		puts "Winner is #{winner}!"
	end

	def play_with_input
		while !winner
			get_player_moves
			@ref.attack(@player1, @player2)
			status
		end
		puts "Winner is #{winner}!"
	end

	def get_player_moves
		valid_moves =["definitive","weak","strong"]
		print "Player 1 Move: "
		player1_move = gets.chomp.downcase
		
		while !valid_moves.include?(player1_move)
			print "Player 1 Please enter valid move: "
			player1_move = gets.chomp.downcase
		end

		@player1.move = player1_move

		print "Player 2 Move: "
		player2_move = gets.chomp.downcase

		while !valid_moves.include?(player2_move)
			print "Player 2 Please enter valid move: "
			player2_move = gets.chomp.downcase
		end

		@player2.move = player2_move
	end

end

player1 = RoboContender.new("Player1")
player2 = RoboContender.new("Player2")
ref = Referee.new

cage = RoboCage.new(player1,player2,ref)
cage.auto_play_game