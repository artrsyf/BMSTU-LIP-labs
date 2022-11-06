# frozen_string_literal: true

# class with function for finding element with input accuracy
class CollectionFinder
  EPS_1 = 10**-2
  EPS_2 = 10**-4

  def input_function(number)
    number.fdiv(number**2 + 2)
  end

  def solve(eps)
    index = 1
    loop do
      element = input_function(index)
      return [element, index] if element < eps

      index += 1
    end
  end
end
