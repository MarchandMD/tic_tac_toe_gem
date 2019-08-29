require 'spec_helper'

module TicTacToe
    RSpec.describe Board do
        
        context "#initialize" do
            it "initializes the board with a grid" do
                expect { Board.new(grid: "grid") }.to_not raise_error
            end

            it "sets the grid with three rows by default" do
                board = Board.new
                expect(board.grid.size).to eql(3)
            end

            it "creates 3 things in each row by default" do
                board = Board.new
                board.grid.each do |row|
                    expect(row.length).to eql(3)
                end
            end

        end

        describe "#grid" do
            it "returns the value" do
                board = Board.new(grid: "hello")
                expect(board.grid).to eql("hello")
            end
        end

        describe "#get_cell" do
            it "returns the cell value based on the (x,y) coordinates" do
                board = [['','',''],['','','something'],['','','']]
                test_board = Board.new(grid: board)
                expect(test_board.get_cell(2,1)).to eql("something")
            end
        end

    end 
end