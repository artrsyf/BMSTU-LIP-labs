# frozen_string_literal: true

# xml format controller
class XmlController < ApplicationController
  before_action :require_params, only: [:index]

  def index
    calculate
  end

  def require_params
    @number = params[:input_number]
  end

  def calculate
    @result = find_happy_numbers

    respond_to do |format|
      format.xml { render xml: @result.to_xml }
      format.rss { render xml: @result.to_xml }
    end
  end

  def find_happy_numbers
    are_range_elements_happy = []
    range = (0..@number.to_i).to_a
    range.each_with_index do |element, index|
      modifie_number_length(element.to_s)
      are_range_elements_happy[index] = happy?(modifie_number_length(element.to_s))
    end
    check(@number, happy_array_maker(are_range_elements_happy))
  end

  def modifie_number_length(number)
    if number.length < 6
      '0' * (6 - number.length.to_i) + number
    else
      number
    end
  end

  def happy?(element)
    element.split('').select.with_index do |_element, index|
      index < 3
    end.map(&:to_i).sum == element.split('').select.with_index do |_element, index|
                             index >= 3
                           end.map(&:to_i).sum
  end

  def happy_array_maker(range_boolean_array)
    happy_elements = []
    range_boolean_array.each_with_index do |is_number_happy, number|
      happy_elements.push(number) if is_number_happy
    end
    happy_elements
  end

  def check(number, result_array)
    if number.nil? || number.empty?
      { message: 'Input is empty' }
    elsif (number =~ (/^\d+$/)).nil?
      { message: 'Incorrect input' }
    elsif number.to_i > 999_999
      { message: 'Your input is > 999_999' }
    else
      result_array.each_with_index.map { |array_element, index| { position: index + 1, element: array_element } }
    end
  end
end
