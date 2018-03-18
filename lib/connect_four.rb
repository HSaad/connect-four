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

		#restart if play_again?
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

	def game_over?
		if check_win()
			print_winner()
			return true
		elsif board_full
			print_no_winner()
			return true
		else
			return false
		end
	end

	def check_win
		return false if @current_player == nil

	end

	def board_full

	end

	def print_winner
		if @current_player == @player1
			player = "Player 1"
		else 
			player = "Player 2"
		end

		puts "Congratulations #{player}!"
		puts "You Win!"
	end

	def print_no_winner
		puts "Tie!"
		puts "No Winner!"
	end

	def play_again?
		puts "Play Again? (y/n)"
		response = gets.chomp
		if (response.downcase.strip == "y" || response.downcase.strip == "yes")
			return true
		else
			return false
		end
	end

	def restart

		start()
	end

end

class Board
	attr_accessor :board_array

	def initialize
		@board_array = [[" ", " ", " ", " ", " ", " ", " "],[" ", " ", " ", " ", " ", " ", " "],[" ", " ", " ", " ", " ", " ", " "], [" ", " ", " ", " ", " ", " ", " "],[" ", " ", " ", " ", " ", " ", " "],[" ", " ", " ", " ", " ", " ", " "]]
	end

	def draw(array=@board_array)
		puts "__________________________"
		array.each do |subarr|
			subarr.each_with_index do |item, index|
				if index == 6
					print item
				else
					print item + " | "
				end
			end
			puts "\n__________________________"
		end
	end
end

class Player
	attr_accessor :player_moves, :mark

	def initialize(mark)
		@player_moves = []
		@mark = mark
	end

	def move(board_array)
		puts "Make your move: "
		puts "Column(1-7)"
		col = gets.chomp
		puts "Row (1-6)"
		row = gets.chomp
		if valid_move?(col, row, board_array)
			move = [col.to_i, row.to_i]
			@player_moves.push(move)
		else
			move(board_array)
		end
	end

	def valid_move?(col, row, board_array)

	end

end

class Computer < Player

	def move()

	end
end

game = Game.new()
game.start