# frozen_string_literal: true

# super class
class Three
  attr_accessor :expression

  def initialize(arg)
    @expression = arg[:expression].tr('()', '')
  end

  def return_calculate
    b = binding
    "#{expression} = #{b.eval(expression)}"
  end

  def return_expression
    expression
  end

  def self.descendants
    ObjectSpace.each_object(Class).select { |klass| klass < self }
  end
end

# descendant class
class BracketsThree < Three
  def initialize(arg)
    super
    @expression = "(#{arg[:expression].tr('()', '')})"
  end
end
