# frozen_string_literal: true

def decryption(char, shift_number_unprocessed)
  if shift_number_unprocessed <= 'z'.ord - char.ord
    shift_number = shift_number_unprocessed
    (char.ord + shift_number).chr(Encoding::UTF_8)
  else
    shift_number = shift_number_unprocessed - shift_number_unprocessed / 26 * 26
    if shift_number <= 'z'.ord - char.ord
      (char.ord + shift_number).chr(Encoding::UTF_8)
    else
      shift_number_end = (shift_number - ('z'.ord - char.ord))
      ('a'.ord + shift_number_end - 1).chr(Encoding::UTF_8)
    end
  end
end

def word_decryption(word, shift_number_unprocessed)
  new_word = ''
  word.split('').each do |char_unprocessed|
    new_word += decryption(char_unprocessed, shift_number_unprocessed)
  end
  new_word
end

def string_decryption(string_array, shift_number_unprocessed)
  new_arr = []
  (0..string_array.length - 1).each do |index|
    new_arr[index] = word_decryption(string_array[index], shift_number_unprocessed)
  end
  new_arr
end
# puts('a'.ord) 97
# puts('z'.ord) 122
# puts('A'.ord) 65
# puts('Z'.ord) 90

puts 'Input number of decryption'
decryption_number = gets.chomp.to_i
string_array = []
word_matrix = []
puts 'Input a few string, "end string" - end of input'
loop do
  input = gets.chomp
  break if input == 'end string'

  string_array.push(input)
end
(0..string_array.length - 1).each do |i|
  word_matrix[i] = string_array[i].split(' ')
end
puts 'Default text'
word_matrix.each do |string|
  puts string * ' '
end
word_matrix.each_with_index do |string, index|
  word_matrix[index] = string_decryption(string, decryption_number)
end
puts 'processed text'
word_matrix.each do |string|
  puts string * ' '
end


