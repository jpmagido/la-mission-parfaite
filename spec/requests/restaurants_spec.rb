require 'rails_helper'

RSpec.describe "Restaurants", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/restaurants/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /index" do
    it "returns http success" do
      get "/restaurants/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /search" do
    it "returns http success" do
      get "/restaurants/search"
      expect(response).to have_http_status(:success)
    end
  end

end
