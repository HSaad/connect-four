require "connect_four"

describe Game do
	
	#start method tests
	describe "start" do
		context "generates a new game" do
			before(:example) do
				@game = Game.new()
			end
			it "initializes board array" do
				#expect (@game.board_array).eql?(["1", "2", "3", "4", "5", "6", "7", "8", "9"])
			end
		end
	end

	#game_over method tests
	describe ".game_over?" do
		before(:example) do
			@game = Game.new()
			#@game.current_player = Player.new('o')
		end

		context "given an initial game" do
			it "returns false" do
				#expect(@game.game_over?).to eql(false)
			end
		end

		context "given a current player with winning move" do
			before(:example) do
				#@game.current_player.player_moves = [1,2,3]
			end
			it "returns true" do
				#expect(@game.game_over?).to eql(true)
			end
		end

		context "given a full board" do
			before(:example) do
				#@game.board_array = ["x", "o", "x", "o", "x", "o", "x", "o", "x"]
			end
			it "returns true" do
				#expect(@game.game_over?).to eql(true)
			end
		end
	end
end

describe Player do

	#initialize method tests
	describe "start" do
		context "generates a new player" do
			before(:example) do
				@player = Player.new("x")
			end

			it "initializes player_moves" do
				expect (@player.player_moves).eql?([])
			end

			it "sets the mark for player" do
				expect (@player.mark).eql?("x")
			end
		end
	end

	describe ".valid_move" do
		before(:example) do
			@player = Player.new('x')
		end
		
		context "given an initial game and valid move" do
			it "returns true" do
			#	expect(@player.valid_move?(2, ["1", "2", "3", "4", "5", "6", "7", "8", "9"])).to eql(true)
			end
		end
	end
end

describe Board do

	#initialize method tests
	describe "start" do
		context "generates a new board" do
			before(:example) do
				@board = Board.new()
			end
			it "initializes board array" do
				expect (@board.board_array).eql?([[" ", " ", " ", " ", " ", " ", " "],[" ", " ", " ", " ", " ", " ", " "],[" ", " ", " ", " ", " ", " ", " "], [" ", " ", " ", " ", " ", " ", " "],[" ", " ", " ", " ", " ", " ", " "],[" ", " ", " ", " ", " ", " ", " "]])
			end
		end
	end
end