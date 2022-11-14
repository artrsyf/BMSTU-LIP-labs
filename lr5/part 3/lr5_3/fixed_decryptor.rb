# frozen_string_literal: true

# class makes decryption for char, word, string, text
class Decryptor
  SPECIAL_SYMBOLS_ARRAY = ['!', '-', '?', '.', ',', ';', ':', '(', ')'].freeze
  ALPHABET_LOWER = ('a'..'z').freeze
  ALPHABET_UPPER = ('A'..'Z').freeze
  ALPHABET_LENGTH = 26
  attr_accessor :default_word_matrix, :decryption_number

  def cycled_alphabet_maker(enum)
    Enumerator.new do |element|
      index = 0
      loop do
        element << enum.to_a[index % ALPHABET_LENGTH]
        index += 1
      end
    end
  end

  def initialize
    @default_word_matrix = []
    @decryption_number = 0
  end

  def string_array_maker
    puts 'Input number of decryption'
    @decryption_number = gets.chomp.to_i
    string_array = []
    puts 'Input a few string, "end string" - end of input'
    loop do
      input = gets.chomp
      break if input == 'end string'

      string_array.push(input)
    end
    string_array
  end

  def char_matrix_maker
    string_array = string_array_maker
    (0..string_array.length - 1).each { |i| @default_word_matrix[i] = string_array[i].split(' ') }
  end

  def cycled_alphabet_select(register, char)
    cycled_alphabet_maker(register).take(cycled_alphabet_maker(register).find_index(char) + @decryption_number + 1).last
  end

  def char_decryption(char)
    if ALPHABET_LOWER.include? char
      cycled_alphabet_select(ALPHABET_LOWER, char)
    elsif ALPHABET_UPPER.include? char
      cycled_alphabet_select(ALPHABET_UPPER, char)
    elsif SPECIAL_SYMBOLS_ARRAY.include? char
      char
    end
  end

  def word_decryption(word)
    new_word = ''
    word.split('').each { |char_unprocessed| new_word += char_decryption(char_unprocessed) }
    new_word
  end

  def string_decryption(string_array)
    new_arr = []
    (0..string_array.length - 1).each { |index| new_arr[index] = word_decryption(string_array[index]) }
    new_arr
  end

  def text_decryption
    processed_word_matrix = []
    default_word_matrix.each_with_index { |string, index| processed_word_matrix[index] = string_decryption(string) }
    processed_word_matrix
  end
end
