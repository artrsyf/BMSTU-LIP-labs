# frozen_string_literal: true

def foo1(arg)
  Math.sin(arg).fdiv(arg)
end

def foo2(arg)
  Math.tan(arg + 1).fdiv(arg + 1)
end

def integrate(number, lower_limit, upper_limit, foo)
  rectangle_width = (upper_limit - lower_limit).fdiv(number)
  limit_sum = 0
  number.times do |iteration|
    left_side = lower_limit + iteration * rectangle_width
    right_side = left_side + rectangle_width
    xi = (left_side + right_side).fdiv(2)
    limit_sum += rectangle_width * send(foo, xi)
  end
  limit_sum
end

def output
  yield
end
puts 'Choose some realized function; number regulate accuracy of calculation'
puts 'Input lower limit: '
a = gets.chomp.to_i
puts 'Input upper limit: '
b = gets.chomp.to_i
puts 'Input number of dividing (accuracy): '
n = gets.chomp.to_i
lambda_integrate = -> { integrate(n, a, b, :foo2) } # lambda
puts integrate(n, a, b, :foo2) # function changing realised here
puts lambda_integrate.call # block
output { puts integrate(n, a, b, :foo2) }

