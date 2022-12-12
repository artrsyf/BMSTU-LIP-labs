require 'rails_helper'

RSpec.describe "Xmls", type: :request do
  describe "GET /index" do
    it 'returns http success' do
      get 'http://localhost:3000/?input_number=2000&format=xml'
      expect(response).to have_http_status(:success)
    end
  end
  context 'check response content format' do
    it 'should return xml response format' do
      get 'http://localhost:3000/?input_number=2000&format=xml'
      expect(response.content_type).to eq('application/xml; charset=utf-8')
    end
    it 'check server response with xml' do
      get 'http://localhost:3000/?input_number=2000&format=xml'
      expect(response.headers['Content-Type']).to include('xml')
    end
    it 'check server response with rss' do
      get 'http://localhost:3000/?input_number=2000&format=rss'
      expect(response).to have_http_status(:success)
      expect(response.headers['Content-Type']).to include('application/rss+xml')
    end
  end
  context 'check that with different inputs xml-responses are differnt to' do
    it 'should show that xmls are different' do
      random_input = rand(2000..3000)
      step = 10_000
      get root_path, params: { input_number: random_input, format: :xml }
      first_response = response
      get root_path, params: { input_number: random_input + step, format: :xml }
      expect(response.body).not_to eq(first_response.body)
    end
  end
end
