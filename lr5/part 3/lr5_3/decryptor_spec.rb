# frozen_string_literal: true

require_relative 'decryptor'
require 'faker'

def rspec_matrix_maker(string_array)
  # string_array = text.split("\n")
  word_matrix = []
  (0..string_array.length - 1).each do |i|
    word_matrix[i] = string_array[i].split(' ')
  end
  word_matrix
end

RSpec.describe Decryptor do
  describe '#char_decryption' do
    context 'Situation when we input number and there is not turning and periods' do
      let(:example_object) { Decryptor.new }
      it 'should return char with position = char + input_number' do
        example_object.decryption_number = 12
        expect(example_object.char_decryption('a')).to eq('m')
        expect(example_object.char_decryption('A')).to eq('M')
      end
    end
    context 'Situation when we input number with periods and there is not turning' do
      let(:example_object) { Decryptor.new }
      it 'should return char with position = char + input number - periods of turning (26)' do
        example_object.decryption_number = 34 # there is only one period => we need to add 8
        expect(example_object.char_decryption('f')).to eq('n')
        expect(example_object.char_decryption('F')).to eq('N')
        example_object.decryption_number = 83 # there are three periods => we need to add 5
        expect(example_object.char_decryption('k')).to eq('p')
        expect(example_object.char_decryption('K')).to eq('P')
      end
    end
    context 'Situation when we input number without periods and turning happens' do
      let(:example_object) { Decryptor.new }
      it 'should return char with position = "a" + some number that we have calculated
      like consider path to "z" and add remain to "a"' do
        example_object.decryption_number = 30
        expect(example_object.char_decryption('s')).to eq('w')
        expect(example_object.char_decryption('S')).to eq('W')
        example_object.decryption_number = 26
        expect(example_object.char_decryption('x')).to eq('x')
        expect(example_object.char_decryption('X')).to eq('X')
        example_object.decryption_number = 3
        expect(example_object.char_decryption('x')).to eq('a')
        expect(example_object.char_decryption('X')).to eq('A')
      end
    end
    context 'Complex situation when we input number with periods and turning happens' do
      let(:example_object) { Decryptor.new }
      it 'should return corrext answer taking into concideration previous points (periods and turnings)' do
        example_object.decryption_number = 1897
        expect(example_object.char_decryption('s')).to eq('r') # number = 1897: 72 periods, turn = 25
        expect(example_object.char_decryption('S')).to eq('R')
        example_object.decryption_number = 432
        expect(example_object.char_decryption('x')).to eq('n') # number = 432: 16 periods, turn = 16
        expect(example_object.char_decryption('X')).to eq('N')
        example_object.decryption_number = 76
        expect(example_object.char_decryption('c')).to eq('a') # number = 76: 2 periods = 26 + 26, turn = 24
        expect(example_object.char_decryption('C')).to eq('A')
      end
    end
  end
  describe '#word_decryption' do
    context 'Different words generated with faker' do
      let(:example_object) { Decryptor.new }
      let(:random_word1) { Faker::Lorem.word }
      let(:random_word2) { Faker::Lorem.word }
      # let(:decrypted_random_word1) { '' } undefined
      # let(:decrypted_random_word2) { '' } undefined
      it 'should return word decrypted with char_decryption method' do
        decrypted_random_word1 = ''
        decrypted_random_word2 = ''
        example_object.decryption_number = 15
        random_word1.each_char do |char|
          decrypted_random_word1 += example_object.char_decryption(char)
        end
        random_word2.each_char do |char|
          decrypted_random_word2 += example_object.char_decryption(char)
        end
        expect(example_object.word_decryption(random_word1)).to eq(decrypted_random_word1)
        expect(example_object.word_decryption(random_word2)).to eq(decrypted_random_word2)
      end
    end
  end
  describe '#text_decryption' do
    context 'Check reversibility of this method with random faker text' do
      let(:example_object) { Decryptor.new }
      it 'should return the same text as the input' do
        example_object.decryption_number = 15
        random_text = Faker::Lorem.sentences
        example_object.default_word_matrix = rspec_matrix_maker(random_text) # Text must be matrix of words
        example_object.decryption_number = -15
        example_object.text_decryption
        expect(example_object.default_word_matrix).to eq(rspec_matrix_maker(random_text))
      end
    end
    context 'Check result of this method with random text' do
      let(:example_object) { Decryptor.new }
      it 'should return true as result of comparing' do
        example_object.decryption_number = 15
        random_string_array = ['It is important to keep in mind', 'qwerty', 'zxc', 'vbn']
        example_object.default_word_matrix = rspec_matrix_maker(random_string_array)
        example_object.text_decryption
        expect(example_object.text_decryption).to eq([%w[Xi xh xbedgipci id ztte xc bxcs], %w[fltgin], %w[omr], %w[kqc]])
      end
    end
  end
end
