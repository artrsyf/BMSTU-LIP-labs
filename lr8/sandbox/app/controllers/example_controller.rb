# frozen_string_literal: true

# simple controller
class ExampleController < ApplicationController
  before_action :require_params, only: [:show]

  def input() end

  def show
    @range = (0..@number.to_i).to_a
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

  def require_params
    flash[:error] = check_error
    flash[:error].nil? ? @number = params[:input_number] : redirect_to(root_path)
  end

  def check_error
    if params[:input_number].nil? || params[:input_number].empty?
      'Input is empty'
    elsif (params[:input_number] =~ (/^\d+$/)).nil?
      'Incorrect input'
    elsif params[:input_number].to_i > 999_999
      'Your input is > 999_999'
    end
  end
end
