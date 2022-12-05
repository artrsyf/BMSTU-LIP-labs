# frozen_string_literal: true

# controller realisation
class DbController < ApplicationController
  def index; end

  def show
    @input = params[:input_number]
    if (Happy.find_by(input: @input))
      @result = Happy.find_by(input: @input).json_decode
    else
      # @output_pole = ActiveSupport::JSON.encode(Happy.new(input: @input).find_happy_numbers)
      @output_pole = Happy.new(input: @input).json_encode
      result1 = Happy.create(input: @input, output: @output_pole)
      if result1.save
        @result = result1.json_decode
      else
        redirect_to root_path, notice: result1.errors.messages[:input][0]
      end
    end
  end

  def render_db
    render xml: Happy.all.to_a
  end
end
