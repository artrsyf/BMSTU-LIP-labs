# frozen_string_literal: true

require 'pry'
# solving class
class ArrayProcessing
  def array_maker
    new_array = []
    loop do
      x = gets.chomp.to_i
      break if x.zero?

      new_array.push(x)
    end
    new_array
  end

  def process(array)
    return 0 if array.empty?

    array.push('x')
    prev_count = count = 1
    (1..array.length - 1).each do |i|
      if array[i] == array[i - 1] # { count += 1 } why doesn't work
        count += 1
      elsif count > prev_count
        prev_count = count
        count = 1
      else
        count = 1
      end
    end
    prev_count
  end

  def output
    process(array_maker)
  end
end
