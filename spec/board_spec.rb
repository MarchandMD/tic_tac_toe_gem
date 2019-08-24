require 'spec_helper'

module TicTacToe
    RSpec.describe Board do
        
        context "#initialize" do
            it "initializes the board with a grid" do
                expect { Board.new(grid: "grid") }.to_not raise_error
            end
        end

    end 
end