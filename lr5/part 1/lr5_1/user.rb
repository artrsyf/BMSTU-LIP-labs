# frozen_string_literal: true

require_relative 'expression'
puts 'Input first number: '
first_string_number = gets.chomp # v =~ /\A[-+]?[0-9]*\.?[0-9]+\Z/
puts 'Input second number: '
second_string_number = gets.chomp
if (first_string_number =~ /\A[-+]?[0-9]*\.?[0-9]+\Z/) && (second_string_number =~ /\A[-+]?[0-9]*\.?[0-9]+\Z/)
  first_number = first_string_number.to_f
  second_number = second_string_number.to_f
  puts 'The answer is: '
  puts Expression.new(arg1: first_number, arg2: second_number).solvation
else
  puts 'Incorrect input'
end
