  module TicTacToe
  class Game
    attr_reader :players, :board, :current_player, :other_player
    
    def initialize(players, board = Board.new)
      @players = players
      @board = board
      @current_player, @other_player = players.shuffle
    end

    def switch_players
      @current_player, @other_player = @other_player, @current_player
    end

    def solicit_move
      "#{current_player.name}: select a number from 1 - 9 to make a move"
    end
  end
    
end
