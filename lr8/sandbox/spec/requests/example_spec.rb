# frozen_string_literal: true

# RSpec tests starts only with explicit reference of the full path to _spec.rb in project directory
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
    context 'integer input' do
      it 'returns http success' do
        get '/example/show', params: { input_number: '2132' }
        expect(response).to have_http_status(:success)
      end
    end
    context 'string input' do
      it 'returns error 302' do
        get '/example/show', params: { input_number: 'ewqwq' }
        expect(response).to have_http_status(302)
      end
    end
    context 'float input' do
      it 'returns error 302' do
        get '/example/show', params: { input_number: '2.5' }
        expect(response).to have_http_status(302)
      end
    end
    context 'mixed input' do
      it 'returns error 302' do
        get '/example/show', params: { input_number: '2132qwqwdwd2' }
        expect(response).to have_http_status(302)
      end
    end
    context 'empty input' do
      it 'returns error 302' do
        get '/example/show', params: { input_number: '' }
        expect(response).to have_http_status(302)
      end
    end
  end
  context 'output content on show page' do
    it 'should return first 10 correct happy numbers' do
      get example_show_path, params: { input_number: 100_000 }
      html = Nokogiri::HTML(response.body)
      FIRST_TEN_HAPPY_ELEMENTS.each_with_index do |element, index|
        th_element = html.search('td')[1 + index * 2].text.to_i
        expect(th_element).to eq(element)
      end
    end
  end
end
