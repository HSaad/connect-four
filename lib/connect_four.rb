class Game

	def initialize
		@board = Board.new()
		@player1 = Player.new("x")
		@board_array = @board.board_array
	end

	def start
		print_instructions()
		choose_opponents()
		@board.draw()

		puts "Player 1 will go first"

		while !(game_over?)
			switch_players()
			@current_player.move(@board_array)
			last_move = @current_player.player_moves.last
			@board_array[last_move[1]][last_move[0]] = @current_player.mark
			@board.draw(@board_array)
		end

		restart if play_again?
	end

	def print_instructions
		puts "Welcome to Connect Four!"

		puts "To win get 4 of your pieces (either an 'x' or an 'o') consecutively in a horizontal, vertical, or diagonal row."
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

		return ascending_diagonal_win || descending_diagonal_win || horizontal_win || vertical_win
	end

	def ascending_diagonal_win
		mark = @current_player.mark
		3.upto(6) do |j|
        3.times do |i|
          return true if (@board_array[i][j] == mark && @board_array[i+1][j-1] == mark && @board_array[i+2][j-2] == mark && @board_array[i+3][j-3] == mark)
      end
    end
    return false
	end

	def descending_diagonal_win
		mark = @current_player.mark
		3.upto(6) do |j|
			3.upto(5) do |i|
				return true if (@board_array[i][j] == mark && @board_array[i-1][j-1] == mark && @board_array[i-2][j-2] == mark && @board_array[i-3][j-3] == mark)
			end
		end
		return false
	end

	def horizontal_win
		@board_array.each do |row|
			row_string = row.join
			return true if row_string.include?("xxxx") || row_string.include?("oooo")
		end
		return false
	end

	def vertical_win
		current_streak = 0
		
		6.times do |col_num|
			@board_array.each_with_index do |row, i|
				if @board_array[i][col_num] == @current_player.mark
					current_streak += 1
					return true if current_streak >=  4
				else
					current_streak = 0
				end
			end
		end
		return false
	end

	def board_full
		@board_array.each do |row|
			return false if row.include? " "
		end

		return true
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
		puts "___________________________"
		puts "Play Again? (y/n)"
		response = gets.chomp
		if (response.downcase.strip == "y" || response.downcase.strip == "yes")
			return true
		else
			return false
		end
	end

	def restart
		@board = Board.new()
		@player1 = Player.new("x")
		@board_array = @board.board_array

		start()
	end

end

class Board
	attr_accessor :board_array

	def initialize
		@board_array = [[" ", " ", " ", " ", " ", " ", " "],[" ", " ", " ", " ", " ", " ", " "],[" ", " ", " ", " ", " ", " ", " "], [" ", " ", " ", " ", " ", " ", " "],[" ", " ", " ", " ", " ", " ", " "],[" ", " ", " ", " ", " ", " ", " "]]
	end

	def draw(array=@board_array)
		puts "  1   2   3   4   5   6   7  "
		puts "_____________________________"
		array.each do |subarr|
			print "  "
			subarr.each_with_index do |item, index|
				if index == 6
					print item
				else
					print item + " | "
				end
			end
			puts "\n_____________________________"
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
		puts "Column(1-7): "
		move = gets.chomp
		#puts "Row (1-6): "
		#row = gets.chomp
		if valid_move?(move, board_array)
			col = @player_moves.last[0]
			row = @player_moves.last[1]
			puts "Your Move: (#{col}, #{row})"
		else
			move(board_array)
		end
	end

	def valid_move?(move, board_array)
		col = move.to_i

		return false if (col > 7 || col < 1)
	
		5.downto(0) do |row|
			if board_array[row][col-1] == " "
				moves = [col.to_i - 1, row]
				@player_moves.push(moves)
				return true 
			end
		end 

		return false
	end

end

class Computer < Player
	
	def move(board_array)
		move = 1 + rand(7)
		if valid_move?(move, board_array)
			col = @player_moves.last[0]
			row = @player_moves.last[1]
			puts "Computer's Move: (#{col}, #{row})"
		else
			move(board_array)
		end
	end
end

game = Game.new()
game.start