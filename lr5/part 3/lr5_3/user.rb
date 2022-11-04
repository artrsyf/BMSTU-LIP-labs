# frozen_string_literal: true

require_relative 'decryptor'

object = Decryptor.new
object.char_matrix_maker
puts "\nDefault text: "
object.default_word_matrix.each do |string|
  puts string * ' '
end
puts "\nProcessed text: "
object.text_decryption.each do |string|
  puts string * ' '
end
