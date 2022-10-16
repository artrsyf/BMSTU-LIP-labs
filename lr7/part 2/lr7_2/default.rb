# frozen_string_literal: true

# super class
class Three
  attr_accessor :expression

  def initialize(arg)
    @expression = arg[:expression].tr('()', '')
  end

  def print_calculate
    print "#{expression} = "
    print eval(expression)
    print "\n"
  end

  def print_expression
    puts expression
  end
end

# descendant class
class BracketsThree < Three
  def initialize(arg)
    super
    @expression = "(#{arg[:expression]})"
  end
end

parent = Three.new(expression: '2 + 3')
parent.print_calculate
parent.print_expression
child = BracketsThree.new(expression: '4 + 15')
child.print_calculate
child.print_expression

