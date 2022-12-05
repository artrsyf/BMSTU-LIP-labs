require 'rails_helper'

RSpec.describe "Dbs", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/db/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/db/show"
      expect(response).to have_http_status(:success)
    end
  end

end
