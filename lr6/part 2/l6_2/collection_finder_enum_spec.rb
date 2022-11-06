# frozen_string_literal: true

require_relative 'collection_finder'

RESULT_WITH_NUMBER_100 = 0.00999800039
RESULT_WITH_NUMBER_10000 = 0.00009999999

RSpec.describe CollectionFinder do
  describe '#solve' do
    let(:example_object) { CollectionFinder.new }
    it 'should return the same number with input accuracy' do
      expect((example_object.solve(CollectionFinder::EPS_1)[0] > RESULT_WITH_NUMBER_100 - CollectionFinder::EPS_1) &&
      (example_object.solve(CollectionFinder::EPS_1)[0] < RESULT_WITH_NUMBER_100 + CollectionFinder::EPS_1)).to eq(true) # Аналогично сделать для eps2, мб еще что- то
      expect((example_object.solve(CollectionFinder::EPS_2)[0] > RESULT_WITH_NUMBER_10000 - CollectionFinder::EPS_2) &&
      (example_object.solve(CollectionFinder::EPS_2)[0] < RESULT_WITH_NUMBER_10000 + CollectionFinder::EPS_2)).to eq(true)
    end
  end
end
