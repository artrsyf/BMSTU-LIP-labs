# frozen_string_literal: true

RSpec.describe 'Model check', type: :model do
  context 'Should check right adding unique elements in db by count and inequality of different input' do
    db_count = rand(1..10)
    example_number = rand(2000.3000)
    count = 0
    db_count_before_adding = Happy.all.count
    db_count.times do
      count += 1
      Happy.create(input: example_number + count, output: Happy.new(input: example_number + count).json_encode)
    end
    it 'should add right number of unique elements and db elements should not be equal' do
      expect(Happy.all.count - db_count_before_adding).to eq(db_count)
      expect(Happy.find_by(input: example_number)).not_to eq(Happy.find_by(input: example_number + 1))
    end
  end
end
