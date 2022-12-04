require 'rails_helper'

RSpec.describe "Xmls", type: :request do
  describe "GET /index" do
    it 'returns http success' do
      get 'http://localhost:3000/?input_number=2000&format=xml'
      expect(response).to have_http_status(:success)
    end
  end
  context 'check response format' do
    it 'should return xml + rss response format' do
      get 'http://localhost:3000/?input_number=2000&format=xml'
      expect(response.content_type).to eq('application/xml; charset=utf-8')
    end
  end
end
