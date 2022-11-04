# frozen_string_literal: true

require_relative 'processing'

RSpec.describe ArrayProcessing do
  describe '#process' do
    context 'The simple situation when every element chain appears only once' do
      it 'should return correct length of the biggest chain in array' do
        expect(ArrayProcessing.new.process([1, 2, 3, 3, 4, 4, 4, 4, 5, 5, 5, 6, 6, 9])).to eq(4)
        expect(ArrayProcessing.new.process([91, 4, 5, 3, 3, 3, 2, 1])).to eq(3)
      end
    end
    context 'The situation when in array exist few chains with different lengths of the same elements' do
      it 'should return correct answer
          taking into consideration that there are few chains with different lengths of the same elements' do
        considered_array = [1, 1, 2, 4, 3, 2, 4, 6, 4, 3, 1, 2, 2, 3, 4, 4, 4, 4, 4, 2, 2, 2, 1, 3]
        expect(ArrayProcessing.new.process(considered_array)).to eq(5)
      end
    end
    context 'The situation when we pass empty array' do
      it 'should return 0' do
        empty_array = []
        expect(ArrayProcessing.new.process(empty_array)).to eq(0)
      end
    end
    context 'The situation when we pass array with output chain in the end' do
      it 'should return correct number' do
        considered_array = [1, 1, 2, 4, 3, 2, 4, 6, 4, 3, 1, 2, 2, 3, 4, 4, 4, 4, 4, 2, 5, 5, 5, 5, 5, 5, 5, 5]
        expect(ArrayProcessing.new.process(considered_array)).to eq(8)
      end
    end
  end
end
