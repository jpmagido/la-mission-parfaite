require 'rails_helper'

RSpec.describe "Restaurants", type: :request do
    let(:restaurant) { create(:restaurant) }
  describe "GET /show" do
    it "returns http success" do
      get restaurant_path restaurant
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /index" do
    it "returns http success" do
      get restaurants_path
      expect(response).to have_http_status(:success)
    end
  end
end
