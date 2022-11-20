require 'rails_helper'

RSpec.describe "Examples", type: :request do
  describe "GET /input" do
    it "returns http success" do
      get "/example/input"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/example/show"
      expect(response).to have_http_status(:success)
    end
  end

end
