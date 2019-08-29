require 'spec_helper'

module TicTacToe
    RSpec.describe Cell do

        context "#initialize" do
            it "is initialized with a value of '' by default" do
                cell = Cell.new
                expect(cell.value).to eql('')
            end
        end
    end
end