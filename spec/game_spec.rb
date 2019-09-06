require 'spec_helper'

module TicTacToe
  
  RSpec.describe Game do
    
    let(:bob) { Player.new({color: "X", name: "bob"} ) }
    let(:frank) { Player.new({color: "O", name: "frank"} ) }
    
    context "#initialize" do
      it "randomly selects a current player" do
        allow_any_instance_of(Array).to receive(:shuffle) { [frank, bob] }
        game = Game.new([frank, bob])
        expect(game.current_player).to eq frank
      end

      it "randomly selects an other player" do
        allow_any_instance_of(Array).to receive(:shuffle) { [frank, bob] }
        game = Game.new([frank, bob])
        expect(game.other_player).to eq bob
      end
    end

    context "#switch_player" do
      it "will set @current_player to @other_player" do
        game = Game.new([bob, frank])
        other_player = game.other_player
        game.switch_players
        expect(game.current_player).to eq(other_player)
      end

      it "will set @other_player to @current_player" do 
        game = Game.new([bob, frank])
        current_player = game.current_player
        game.switch_players
        expect(game.other_player).to eq(current_player)
      end
    end

    context "#solicit_move" do
      it "sends a message to the user" do
        allow_any_instance_of(Array).to receive(:shuffle) { [frank, bob] }
        game = Game.new([bob, frank])
        expect(game.solicit_move).to eq("frank: select a number from 1 - 9 to make a move")
      end
    end

  end
end
