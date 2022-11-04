# frozen_string_literal: true

# class makes decryption for char, word, string, text
class Decryptor
  ALPHABET_LENGTH = 26
  FIRST_LOWER_ALPHABET_CHAR = 'a'
  LAST_LOWER_ALPHABET_CHAR = 'z'
  FIRST_UPPER_ALPHABET_CHAR = 'A'
  LAST_UPPER_ALPHABET_CHAR = 'Z'
  attr_accessor :default_word_matrix, :decryption_number

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
    (0..string_array.length - 1).each do |i|
      @default_word_matrix[i] = string_array[i].split(' ')
    end
  end

  def char_decryption(char)
    special_symbols_array = ['!', '-', '?', '.', ',', ';', ':', '(', ')']
    if ('a'..'z').include? char
      lower_limit = FIRST_LOWER_ALPHABET_CHAR
      upper_limit = LAST_LOWER_ALPHABET_CHAR
    elsif ('A'..'Z').include? char
      lower_limit = FIRST_UPPER_ALPHABET_CHAR
      upper_limit = LAST_UPPER_ALPHABET_CHAR
    elsif special_symbols_array.include? char
      return char
    end
    if @decryption_number <= upper_limit.ord - char.ord
      shift_number = @decryption_number
      (char.ord + shift_number).chr(Encoding::UTF_8)
    else
      shift_number = @decryption_number - @decryption_number / ALPHABET_LENGTH * ALPHABET_LENGTH
      if shift_number <= upper_limit.ord - char.ord
        (char.ord + shift_number).chr(Encoding::UTF_8)
      else
        shift_number_end = (shift_number - (upper_limit.ord - char.ord))
        (lower_limit.ord + shift_number_end - 1).chr(Encoding::UTF_8)
      end
    end
  end

  def word_decryption(word)
    new_word = ''
    word.split('').each do |char_unprocessed|
      new_word += char_decryption(char_unprocessed)
    end
    new_word
  end

  def string_decryption(string_array)
    new_arr = []
    (0..string_array.length - 1).each do |index|
      new_arr[index] = word_decryption(string_array[index])
    end
    new_arr
  end

  def text_decryption
    processed_word_matrix = []
    default_word_matrix.each_with_index do |string, index|
      processed_word_matrix[index] = string_decryption(string)
    end
    processed_word_matrix
  end
end
# puts('a'.ord) 97
# puts('z'.ord) 122
# puts('A'.ord) 65
# puts('Z'.ord) 90
