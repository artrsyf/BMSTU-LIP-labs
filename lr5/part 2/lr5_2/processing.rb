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
    count = 1
    count_array = []
    array.each_with_index do |_element, index|
      array[index] == array[index - 1] ? count += 1 : count = 1
      count_array.push(count)
    end
    count_array.max
  end

  def output
    process(array_maker)
  end
end
