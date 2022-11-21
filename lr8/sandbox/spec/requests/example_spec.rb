# frozen_string_literal: true

require 'rails_helper'
require 'nokogiri'

FIRST_TEN_HAPPY_ELEMENTS = [0, 1001, 1010, 1100, 2002, 2011, 2020, 2101, 2110, 2200].freeze

RSpec.describe 'Examples', type: :request do
  describe 'GET /input' do
    it 'returns http success' do
      get root_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/example/show'
      expect(response).to have_http_status(:success)
    end
  end
  context 'output content on show page' do
    it 'should return first 10 correct happy numbers' do
      get example_show_path
      html = Nokogiri::HTML(response.body)
      FIRST_TEN_HAPPY_ELEMENTS.each_with_index do |element, index|
        th_element = html.search('th')[3 + 2 * index].text.to_i
        expect(th_element).to eq(element)
      end
    end
  end
end
