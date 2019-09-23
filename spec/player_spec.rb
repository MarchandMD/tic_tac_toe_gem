# frozen_string_literal: true

require 'spec_helper'

module TicTacToe
  RSpec.describe Player do
    describe '#initialize' do
      it 'raises an exception if initialized with {} ' do
        expect { Player.new({}) }.to raise_error(KeyError)
      end

      it 'does not raise an exception if initialized with a valid hash' do
        input = { color: 'x', name: 'something' }
        expect { Player.new(input) }.to_not raise_error
      end
    end

    describe '#color' do
      it 'returns the color' do
        input = { color: 'x', name: 'something' }
        player = Player.new(input)
        expect(player.color).to eql('x')
      end
    end

    describe '#name' do
      it 'returns the value of the players name' do
        input = { color: 'x', name: 'something' }
        player = Player.new(input)
        expect(player.name).to eql('something')
      end
    end
  end
end
