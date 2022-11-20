# frozen_string_literal: true

# simple controller
class ExampleController < ApplicationController
  def input() end

  def show
    @range = (0..999_999).to_a
    @compare = find_happy_numbers
  end

  private

  def find_happy_numbers
    @found_elements = []
    @range.each_with_index do |element, index|
      modified_element = if element.to_s.length < 6
                           '0' * (6 - element.to_s.length.to_i) + element.to_s
                         else
                           element.to_s
                         end
      @found_elements[index] = happy?(modified_element)
    end
    @found_elements
  end

  def happy?(element)
    element.split('').select.with_index do |_element, index|
      index < 3
    end.map(&:to_i).sum == element.split('').select.with_index do |_element, index|
                             index >= 3
                           end.map(&:to_i).sum
  end
end
