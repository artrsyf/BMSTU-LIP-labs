# frozen_string_literal: true

require_relative 'integration'

ANSWER1 = 36 # [-2; 4]
ANSWER2 = 0.130399435583433 # [0; pi/4]
ACCURACY = 100_000

RSpec.describe 'Integration' do
  describe '#integrate' do
    let(:example_object) { Integration.new }
    context 'a few examples of integration' do
      it 'should integrate correctly' do
        example_lambda1 = ->(arg) { 8 + 2 * arg - arg**2 }
        example_lambda2 = ->(arg) { arg * Math.tan(arg)**2 }
        expect((example_object.integrate(ACCURACY, -2, 4, example_lambda1) - ANSWER1).abs < 1.fdiv(ACCURACY))
          .to eq(true)
        expect((example_object.integrate(ACCURACY, 0, Math::PI.fdiv(4), example_lambda2) - ANSWER2).abs < 1.fdiv(ACCURACY))
          .to eq(true)
      end
    end
  end
end