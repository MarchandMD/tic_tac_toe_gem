# frozen_string_literal: true

require 'spec_helper'

module TicTacToe
  RSpec.describe Cell do
    context '#initialize' do
      it "is initialized with a value of '' by default" do
        cell = Cell.new
        expect(cell.value).to eql('')
      end

      it "can be initialized with a value of 'x' by option" do
        cell = Cell.new('x')
        expect(cell.value).to eql('x')
      end
    end
  end
end
