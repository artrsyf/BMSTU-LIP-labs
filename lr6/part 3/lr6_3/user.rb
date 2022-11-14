# frozen_string_literal: true

require_relative 'integration'

def foo1(arg)
  Math.sin(arg).fdiv(arg)
end

def foo2(arg)
  Math.tan(arg + 1).fdiv(arg + 1)
end

puts 'Choose some realized function; number regulate accuracy of calculation'
puts 'Input lower limit: '
a = gets.chomp.to_i
puts 'Input upper limit: '
b = gets.chomp.to_i
puts 'Input number of dividing (accuracy): '
n = gets.chomp.to_i
user_object = Integration.new
lambda_math1 = ->(arg) { Math.sin(arg).fdiv(arg) }
proc1 = proc { |arg| Math.sin(arg).fdiv(arg) }
# lambda_math2 = ->(arg) { Math.tan(arg + 1).fdiv(arg + 1) }
# porc2 = proc { |arg| Math.tan(arg + 1).fdiv(arg + 1) }
puts user_object.integrate_function(n, a, b, :foo1)
puts user_object.integrate_lambda(n, a, b, lambda_math1)
puts user_object.integrate_block(n, a, b) { |arg| Math.sin(arg).fdiv(arg) }
puts user_object.integrate_proc(n, a, b, proc1)
