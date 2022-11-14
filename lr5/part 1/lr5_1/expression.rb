# frozen_string_literal: true

# solving class
class Expression
  attr_accessor :arg_x, :arg_y

  def initialize(arg)
    @arg_x = arg[:arg1]
    @arg_y = arg[:arg2]
  end

  def solvation
    difference = arg_y - arg_x
    1 + difference.abs + (difference**2).fdiv(2) + difference.abs**3.fdiv(3)
  end
end
