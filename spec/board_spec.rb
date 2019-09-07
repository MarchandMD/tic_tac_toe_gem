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

        describe "#set_cell" do
            it "updates the value of the cell at (x,y) coordinates" do
                Cat = Struct.new(:value)
                grid = [[Cat.new("cool"),'',''],['','',''],['','','']]
                board = Board.new(grid: grid)
                board.set_cell(0,0, "meow")
                expect(board.get_cell(0,0).value).to eq("meow")
            end
        end 

        TestCell = Struct.new(:value)
        let(:x_cell) { TestCell.new("X") } 
        let(:y_cell) { TestCell.new("Y") } 
        let(:empty) { TestCell.new } 

        context "#game_over" do
    
            it "returns :winner if winner? is true" do
                board = Board.new
                allow(board).to receive(:winner?) { true }
                expect(board.game_over).to eq :winner
            end

            it "returns :draw if winner? is false and draw? is true" do
                board = Board.new
                allow(board).to receive(:winner?) { false }
                allow(board).to receive(:draw?) { true }
                expect(board.game_over).to eq :draw
            end

            it "returns false if winner? is false and draw? is false" do
                board = Board.new
                allow(board).to receive(:winner?) { false }
                allow(board).to receive(:draw?) { false }
                expect(board.game_over).to eq false
            end

            it "returns :winner when row has objects that are all the same" do
                grid = [
                    [x_cell, x_cell, x_cell],
                    [y_cell, x_cell, y_cell],
                    [y_cell, y_cell, x_cell]
                ]
                board = Board.new(grid: grid)
                expect(board.game_over).to eq :winner
            end

            it "returns :winner when column has objects that are all the same" do
                grid = [
                    [y_cell, x_cell, x_cell],
                    [y_cell, x_cell, y_cell],
                    [y_cell, y_cell, x_cell]
                ]
                board = Board.new(grid: grid)
                expect(board.game_over).to eq :winner
            end

            it "returns :winner when diagonals have objects that are all the same" do
                grid = [
                    [x_cell, x_cell, empty],
                    [empty, x_cell, y_cell],
                    [y_cell, y_cell, x_cell]
                ]
                board = Board.new(grid: grid)
                expect(board.game_over).to eq :winner
            end

            it "returns :draw when all the spaces on the board are taken" do
                grid = [
                    [y_cell, x_cell, y_cell],
                    [x_cell, x_cell, y_cell],
                    [y_cell, y_cell, x_cell]
                ]
                board = Board.new(grid: grid)
                expect(board.game_over).to eq :draw
            end

            it "returns flase when all the spaces on the board are not taken and not draw/winner" do
                grid = [
                    [y_cell, empty, empty],
                    [x_cell, x_cell, empty],
                    [y_cell, y_cell, x_cell]
                ]
                board = Board.new(grid: grid)
                expect(board.game_over).to be_falsey
            end
            
        
        end

        context "#formatted_grid" do
            it "puts an empty grid to start the game" do
                grid = [
                    [empty, empty, empty],
                    [empty, empty, empty],
                    [empty, empty, empty]
                ]
                board = Board.new(grid: grid)
                allow(empty.value).to receive(:empty?) { true }
                expect(board.formatted_grid).to eq([[empty,empty,empty],[empty,empty,empty],[empty,empty,empty]])
            end
        end

    end 
end