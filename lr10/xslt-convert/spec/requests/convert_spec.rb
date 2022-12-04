require 'rails_helper'

RSpec.describe "Converts", type: :request do
  describe "GET /index" do
    it 'check server response with xml -> html on server' do
      get '/convert/show', params: { input_number: rand(2000..3000), side: 'server' }
      expect(response).to have_http_status(:success)
      expect(response.headers['Content-Type']).to include('html')
    end
    it 'check server response with xml -> html on browser' do
      get '/convert/show', params: { input_number: rand(2000..3000), side: 'client' }
      expect(response).to have_http_status(:success)
      expect(response.headers['Content-Type']).to include('xml')
    end
    it 'check server response with xml' do
      get '/convert/show', params: { input_number: rand(2000..3000), side: 'client-with-xslt' }
      expect(response).to have_http_status(:success)
      expect(response.headers['Content-Type']).to include('xml')
    end
  end
end
