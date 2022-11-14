# frozen_string_literal: true

# class includes integrate function and some example math functions
class Integration
  def foo1(arg)
    Math.sin(arg).fdiv(arg)
  end

  def foo2(arg)
    Math.tan(arg + 1).fdiv(arg + 1)
  end

  def integrate_function(number, lower_limit, upper_limit, foo)
    rectangle_width = (upper_limit - lower_limit).fdiv(number)
    limit_sum = 0
    number.times do |iteration|
      left_side = lower_limit + iteration * rectangle_width
      right_side = left_side + rectangle_width
      xi = (left_side + right_side).fdiv(2)
      limit_sum += rectangle_width * send(foo, xi)
    end
    limit_sum
  end

  def integrate_lambda(number, lower_limit, upper_limit, foo)
    rectangle_width = (upper_limit - lower_limit).fdiv(number)
    limit_sum = 0
    number.times do |iteration|
      left_side = lower_limit + iteration * rectangle_width
      right_side = left_side + rectangle_width
      xi = (left_side + right_side).fdiv(2)
      limit_sum += rectangle_width * foo.call(xi)
    end
    limit_sum
  end

  def integrate_block(number, lower_limit, upper_limit)
    rectangle_width = (upper_limit - lower_limit).fdiv(number)
    limit_sum = 0
    number.times do |iteration|
      left_side = lower_limit + iteration * rectangle_width
      right_side = left_side + rectangle_width
      xi = (left_side + right_side).fdiv(2)
      limit_sum += rectangle_width * yield(xi)
    end
    limit_sum
  end

  def integrate_proc(number, lower_limit, upper_limit, foo)
    rectangle_width = (upper_limit - lower_limit).fdiv(number)
    limit_sum = 0
    number.times do |iteration|
      left_side = lower_limit + iteration * rectangle_width
      right_side = left_side + rectangle_width
      xi = (left_side + right_side).fdiv(2)
      limit_sum += rectangle_width * foo.call(xi)
    end
    limit_sum
  end
end
