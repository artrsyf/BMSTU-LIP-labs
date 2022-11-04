# frozen_string_literal: true

# solving class
class Expression
  attr_accessor :arg_x, :arg_y

  def initialize(arg)
    @arg_x = arg[:arg1]
    @arg_y = arg[:arg2]
  end

  def solvation
    first_term = (arg_y - arg_x).abs
    second_term = ((arg_y - arg_x)**2).fdiv(2)
    third_term = (arg_y - arg_x).abs**3.fdiv(3)
    1 + first_term + second_term + third_term
  end
end
