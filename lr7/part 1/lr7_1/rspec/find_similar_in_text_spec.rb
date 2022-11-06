# frozen_string_literal: true

require_relative '../find_similar_in_text'

RSpec.describe InTextFinder do
  describe '#find_similar' do
    let(:example_object) { InTextFinder.new }
    let(:first_string) { "Qwerty pog\n zxcvbn\p diff" }
    let(:second_string) { "Qwerty pog\n zxcvbn\p fidd" }
    let(:result) { "Qwerty pog\n zxcvbn\p " }
    let(:first_diff_string) { 'qwerty' }
    let(:second_diff_string) { 'zxc' }
    let(:message) { 'Strings have nothing in common' }
    context 'check how find_similar method works' do
      it 'should return mutual part of both words' do
        expect(example_object.find_similar(first_string, second_string)).to eq(result)
      end
    end
    context 'check how find_similar method works with different strings' do
      it 'it should return message' do
        expect(example_object.find_similar(first_diff_string, second_diff_string)).to eq(message)
      end
    end
  end
  describe '#write_in_file' do
    let(:example_object) { InTextFinder.new }
    let(:first_input_file) { File.open('F.txt', 'w+') }
    let(:second_input_file) { File.open('G.txt', 'w+') }
    let(:first_string) { "Qwerty pog\n zxcvbn\p diff" }
    let(:second_string) { "Qwerty pog\n zxcvbn\p fidd" }
    let(:result) { "Qwerty pog\n zxcvbn\p " }
    let(:first_diff_string) { 'qwerty' }
    let(:second_diff_string) { 'zxc' }
    let(:message) { 'Strings have nothing in common' }
    context 'check how find_similar method works with files in write_in_file shell method' do
      it 'should return file with the mutual part of both input files' do
        first_input_file.write(first_string)
        second_input_file.write(second_string)
        first_input_file.close
        second_input_file.close
        example_object.write_in_file
        output_file = File.open('H.txt', 'r')
        expect(output_file.read).to eq(result)
        output_file.close
      end
    end
    context 'check how find_similar method works with files in write_in_file shell method
      if we have got not a coincidence' do
      it 'should write in output_file message' do
        first_input_file.write(first_diff_string)
        second_input_file.write(second_diff_string)
        first_input_file.close
        second_input_file.close
        example_object.write_in_file
        output_file = File.open('H.txt', 'r')
        expect(output_file.read).to eq(message)
        output_file.close
      end
    end
  end
end
