# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "Housings", type: :request do
  let(:housing) { create(:housing) }

  describe "GET /index" do
    it "returns http success" do
      get housings_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get housing_path housing
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /search" do
    context 'search breakfast' do
      let(:city) { create(:city) }
      let!(:house) { create(:housing, breakfast: true, city: city) }

      it "return housings with only breakfast true" do
        get housings_path, params: { breakfast: true }
        expect(response.body).to include "#{house.breakfast}"
        expect(response).to have_http_status(:success)
      end
    end

    context "search city" do
      let(:city) { create(:city, name: "Toulouse") }
      let!(:house) { create(:housing, city: city) }

      it "return Housings which have Toulouse in city's name" do
        get housings_path, params: { city: "Toulouse" }
        expect(response.body).to include "#{house.city.name}"
        expect(response).to have_http_status(:success)
      end
    end

    context "search housing_type" do
      let(:city) { create(:city) }
      let!(:house) { create(:housing, breakfast: true, city: city, housing_type: 2) }

      it "return Housings which have Toulouse in city's name" do
        get housings_path, params: { housing_type: 2 }
        expect(response.body).to include "#{house.housing_type}"
        expect(response).to have_http_status(:success)
      end
    end    
  end
end
