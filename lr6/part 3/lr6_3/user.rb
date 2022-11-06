# frozen_string_literal: true

require_relative 'integration'

puts 'Choose some realized function; number regulate accuracy of calculation'
puts 'Input lower limit: '
a = gets.chomp.to_i
puts 'Input upper limit: '
b = gets.chomp.to_i
puts 'Input number of dividing (accuracy): '
n = gets.chomp.to_i
user_object = Integration.new
lambda_math1 = ->(arg) { Math.sin(arg).fdiv(arg) }
# lambda_math2 = ->(arg) { Math.tan(arg + 1).fdiv(arg + 1) }
puts user_object.integrate(n, a, b, lambda_math1) # function changing realised here
puts user_object.integrate_block(n, a, b) { |arg| Math.sin(arg).fdiv(arg) }
