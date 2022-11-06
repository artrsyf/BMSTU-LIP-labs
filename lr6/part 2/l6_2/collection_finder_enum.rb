# frozen_string_literal: true

# class with function for finding element with input accuracy and Enumerator
class CollectionFinder
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
    required_element = row_create.lazy.detect { |element| element < eps } # why lazy is not necessary, collection length is infinity
    [required_element, row_create.lazy.find_index(required_element) + 1]
  end
end
