# frozen_string_literal: true

require_relative 'three'

parent = Three.new(expression: '2 + 3')
puts 'Your input1: '
puts parent.return_expression
puts 'Your answer1: '
puts parent.return_calculate
child = BracketsThree.new(expression: '4 + 15')
puts 'Your input2: '
puts child.return_expression
puts 'Your answer2: '
puts child.return_calculate
