class Game

	def initialize
		#@board_array = 
		@board = Board.new()
		@player1 = Player.new("x")

	end

	def start
		print_instructions()
		choose_opponents()
		@board.draw()

		puts "Player 1 will go first"

		#while(!game_over?)
		#switch_players()
		#end
	end

	def print_instructions
		puts "Welcome to Connect Four!"

		puts "To win get 4 of your pieces consecutively in a horizontal, vertical, or diagonal row."
	end

	def choose_opponents
		puts "Choose your opponent (Player 2): "
		puts "1: Human"
		puts "2: Computer"
		get_opponent()
	end

	def get_opponent
		opponent = gets.chomp
		if opponent == "1" || opponent.downcase == "human"
			@player2 = Player.new("o")
			@current_player = @player2
		elsif opponent == "2" || opponent.downcase == "computer"
			@player2 = Computer.new("o")
			@current_player = @player2
		else
			choose_opponents()
		end
	end

	def switch_players()
		if @current_player == @player1
			@current_player = @player2
			puts "Current Player: Player 2"
		else
			@current_player = @player1
			puts "Current Player: Player 1"
		end
	end
end

class Board

end

class Player

end

class Computer < Player

end

#game = Game.new()
#game.start