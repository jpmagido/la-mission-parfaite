require 'rails_helper'

RSpec.describe "Cities", type: :request do
  let(:city) { create(:city) }

  describe "GET /index" do
    it "returns http success" do
      get cities_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get city_path city
      expect(response).to have_http_status(:success)
    end
  end
end
