# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "Restaurants", type: :request do
  let!(:city) { create(:city) }
  let!(:restaurant) { create(:restaurant, city: city, vegan: false, name: 'tacos kebab') }
  let!(:vegan_restaurant) { create(:restaurant, city: city, vegan: true) }
  let!(:restaurant_bis) { create(:restaurant) }

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

  describe 'GET /index search' do
    it 'returns restaurant' do
      get restaurants_path, params: { restaurant: { city_id: city.id } }
      expect(response.body).to include restaurant.name
      expect(response.body).to include vegan_restaurant.name
      expect(response.body).not_to include restaurant_bis.name
    end

    it 'returns vegan restaurant' do
      get restaurants_path, params: { restaurant: { city_id: city.id, vegan: true } }
      expect(response.body).to include vegan_restaurant.name
      expect(response.body).not_to include restaurant.name
    end

    it 'returns by name' do
      get restaurants_path, params: { restaurant: { city_id: city.id, name: 'tacos kebab' } }
      expect(response.body).to include restaurant.name
      expect(response.body).not_to include vegan_restaurant.name
    end
  end
end
