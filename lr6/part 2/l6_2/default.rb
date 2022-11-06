# frozen_string_literal: true

EPS_1 = 10**-2
EPS_2 = 10**-4

def input_function(number)
  number.fdiv(number**2 + 2)
end

def row_create
  index = 1
  Enumerator.new do |element|
    loop do
      number = input_function(index)
      element << number
      index += 1
    end
  end
end

def solve(eps)
  count = 1
  loop do
    return [row_create.take(count).last, count] if row_create.take(count).any? { |element| element < eps }

    count += 1
  end
end
puts 'The result with eps = 10^-2'
print 'Element is: '
print solve(EPS_1)[0]
print ' Index is: '
print solve(EPS_1)[1]
puts "\nThe result with eps = 10^-4"
print 'Element is: '
print solve(EPS_2)[0]
print ' Index is: '
print solve(EPS_2)[1]
