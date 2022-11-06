# frozen_string_literal: true

require_relative 'three'

RSpec.describe Three do
  describe '#initialize' do
    let(:simple_expression) { '123 + 7653' }
    let(:complex_expression) { '(73267 + 213412)' }
    let(:result1) { '123 + 7653' }
    let(:result2) { '73267 + 213412' }
    it 'should initialize input expression as a string without brackets' do
      example_object1 = Three.new(expression: simple_expression)
      example_object2 = Three.new(expression: complex_expression)
      expect(example_object1.expression).to eq(result1)
      expect(example_object2.expression).to eq(result2)
    end
  end
  describe '#return_calculate' do
    let(:simple_expression) { '123 + 7653' }
    let(:simple_equation) { '123 + 7653 = 7776' }
    let(:complex_expression) { '(73267 + 213412)' }
    let(:complex_equation) { '73267 + 213412 = 286679' }
    it 'should return correct equation without brackets' do
      example_object1 = Three.new(expression: simple_expression)
      example_object2 = Three.new(expression: complex_expression)
      expect(example_object1.return_calculate).to eq(simple_equation)
      expect(example_object2.return_calculate).to eq(complex_equation)
    end
  end
end

RSpec.describe BracketsThree do
  context 'check is BracketsThree object is a descendant of Three class' do
    let(:simple_expression) { '123 + 7653' }
    let(:complex_expression) { '(73267 + 213412)' }
    let(:three_object) { Three }
    let(:brackets_three_object) { BracketsThree }
    it 'should check is BracketsThree object is a descendant of Three class' do
      expect(three_object.descendants.include?(BracketsThree)).to eq(true)
    end
  end
  describe '#initialize' do
    let(:simple_expression) { '123 + 7653' }
    let(:complex_expression) { '(73267 + 213412)' }
    let(:result1) { '(123 + 7653)' }
    let(:result2) { '(73267 + 213412)' }
    it 'should initialize input expression as a string with brackets' do
      example_object1 = BracketsThree.new(expression: simple_expression)
      example_object2 = BracketsThree.new(expression: complex_expression)
      expect(example_object1.expression).to eq(result1)
      expect(example_object2.expression).to eq(result2)
    end
  end
  describe '#return_calculate' do
    let(:simple_expression) { '123 + 7653' }
    let(:simple_equation) { '(123 + 7653) = 7776' }
    let(:complex_expression) { '(73267 + 213412)' }
    let(:complex_equation) { '(73267 + 213412) = 286679' }
    it 'should return correct equation with brackets' do
      example_object1 = BracketsThree.new(expression: simple_expression)
      example_object2 = BracketsThree.new(expression: complex_expression)
      expect(example_object1.return_calculate).to eq(simple_equation)
      expect(example_object2.return_calculate).to eq(complex_equation)
    end
  end
end
