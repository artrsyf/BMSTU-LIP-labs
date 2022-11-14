# frozen_string_literal: true

require_relative 'integration'

def example_foo1(arg)
  8 + 2 * arg - arg**2
end

def example_foo2(arg)
  arg * Math.tan(arg)**2
end

ANSWER1 = 36 # [-2; 4]
ANSWER2 = 0.130399435583433 # [0; pi/4]
ACCURACY = 100_000

RSpec.describe 'Integration' do
  describe '#integrate' do
    let(:example_object) { Integration.new }
    context 'a few examples of integration with function' do
      it 'should integrate correctly' do
        expect((example_object.integrate_function(ACCURACY, -2, 4, :example_foo1) - ANSWER1).abs <
        1.fdiv(ACCURACY)).to eq(true)
        expect((example_object.integrate_function(ACCURACY, 0, Math::PI.fdiv(4), :example_foo2) - ANSWER2).abs <
        1.fdiv(ACCURACY)).to eq(true)
      end
    end
    context 'a few examples of integration with lambda' do
      it 'should integrate correctly' do
        example_lambda1 = ->(arg) { 8 + 2 * arg - arg**2 }
        example_lambda2 = ->(arg) { arg * Math.tan(arg)**2 }
        expect((example_object.integrate_lambda(ACCURACY, -2, 4, example_lambda1) - ANSWER1).abs <
        1.fdiv(ACCURACY)).to eq(true)
        expect((example_object.integrate_lambda(ACCURACY, 0, Math::PI.fdiv(4), example_lambda2) - ANSWER2).abs <
        1.fdiv(ACCURACY)).to eq(true)
      end
    end
    context 'a few examples of integration with block' do
      it 'should integrate correctly' do
        expect((example_object.integrate_block(ACCURACY, -2, 4) { |arg| 8 + 2 * arg - arg**2 } - ANSWER1).abs <
        1.fdiv(ACCURACY)).to eq(true)
        expect((example_object
        .integrate_block(ACCURACY, 0, Math::PI.fdiv(4)) { |arg| arg * Math.tan(arg)**2 } - ANSWER2)
        .abs < 1.fdiv(ACCURACY)).to eq(true)
      end
    end
    context 'a few examples of integration with proc' do
      it 'should integrate correctly' do
        example_proc1 = proc { |arg| 8 + 2 * arg - arg**2 }
        example_proc2 = proc { |arg| arg * Math.tan(arg)**2 }
        expect((example_object.integrate_proc(ACCURACY, -2, 4, example_proc1) - ANSWER1).abs <
        1.fdiv(ACCURACY)).to eq(true)
        expect((example_object.integrate_proc(ACCURACY, 0, Math::PI.fdiv(4), example_proc2) - ANSWER2).abs <
        1.fdiv(ACCURACY)).to eq(true)
      end
    end
  end
end
