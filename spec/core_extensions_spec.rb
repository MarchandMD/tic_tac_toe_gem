# frozen_string_literal: true

require 'spec_helper'

describe Array do
  context '#all_empty?' do
    it 'returns true if all the elements of the Array are empty' do
      expect(['', '', ''].all_empty?).to be true
    end

    it 'returns false if all the elements of the Array are not empty' do
      expect(['', 'something', ''].all_empty?).to be false
    end

    it 'returns true if the Array is empty' do
      expect([].all_empty?).to be true
    end
  end

  context '#all_same?' do
    it 'returns true if all the elements of the Array are the same' do
      expect(%w[a a a].all_same?).to be_truthy
    end

    it 'returns false if all the elements of the Array are not the same' do
      expect(%w[a b c].all_same?).to be_falsey
    end

    it 'returns true if the Array is empty' do
      expect([].all_same?).to be_truthy
    end
  end

  context '#any_empty?' do
    it 'returns true if any of the elements in the Array are empty' do
      expect(['a', 'b', ''].any_empty?).to be_truthy
    end

    it 'returns false if none of the elements in the Array are empty' do
      expect(%w[a b c].any_empty?).to be_falsey
    end

    it 'returns false if the Array is empty' do
      expect([].any_empty?).to be_falsey
    end
  end

  context '#none_empty?' do
    it 'returns true if all the elements in the Array are not empty' do
      expect(%w[a a a].none_empty?).to be_truthy
    end

    it 'returns false if any of the elements in the Array are empty' do
      expect(['', 'a', 'a'].none_empty?).to be_falsey
    end

    it 'returns false if the Array is empty' do
      expect([].none_empty?).to be_truthy
    end
  end
end
