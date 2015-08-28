class Referee
	def initialize
		@move = {"weak"=> 10, "strong"=> 20, "definitive" => 50}
	end

	def attack(player1, player2)
		if player1.move == "weak" && player2.move == "weak"
			damage1 = 0
			damage2 = 0
		elsif player1.move == "strong" && player2.move == "strong"  
			damage1 = 2* @move["strong"]
			damage2 = 2* @move["strong"]
		elsif player1.move == "definitive" && player2.move == "definitive"
			damage1 = player1.strength
			damage2 = player2.strength
		elsif player1.move == "definitive" && player2.move == "weak"
			damage1 = @move["weak"]
			damage2 = 0
		elsif player1.move == "weak" && player2.move == "definitive"
			damage1 = 0
			damage2 = @move["weak"]
		else
			damage1 = @move[player2.move]
			damage2 = @move[player1.move]
		end

		player1.strength -= damage1 
		player2.strength -= damage2 
	end

end
