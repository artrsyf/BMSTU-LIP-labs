# frozen_string_literal: true

require_relative 'expression'

RSpec.describe Expression do
  describe '#solvation' do
    context 'when all params is integer' do
      it 'returns some expression of its arguments' do
        expect(Expression.new(arg1: 1, arg2: 2).solvation).to eq(3.5)
      end
    end
    context 'when all params is float' do
      it 'returns some expression of its arguments' do
        expect(Expression.new(arg1: 5465.76, arg2: 213.2121312).solvation).to eq(138_051_35.652_755_31)
        expect(Expression.new(arg1: 1.21, arg2: 15.332).solvation).to eq(128.959_442)
      end
    end
  end
end
