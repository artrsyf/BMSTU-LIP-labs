# frozen_string_literal: true

# controller realisation
class DbController < ApplicationController
  def index; end

  def show
    if (happy = Happy.find_by(input: happy_params[:input]))
      @result = happy.json_decode
    else
      result_encoded = Happy.new(happy_params)
      if result_encoded.save
        @result = result_encoded.json_decode
      else
        redirect_to root_path, notice: result_encoded.errors.messages[:input][0]
      end
    end
  end

  def render_db
    render xml: Happy.all.to_a
  end

  private

  def happy_params
    params.permit(:input)
  end
end
