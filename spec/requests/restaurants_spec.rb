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
    context 'when search by city' do
      before { get restaurants_path, params: { restaurant: { city_id: city.id } } }

      it { expect(response.body).to include restaurant.name }
      it { expect(response.body).to include vegan_restaurant.name }
      it { expect(response.body).not_to include restaurant_bis.name }
    end

    context 'when search by vegan' do
      before { get restaurants_path, params: { restaurant: { city_id: city.id, vegan: true } } }

      it { expect(response.body).to include vegan_restaurant.name }
      it { expect(response.body).not_to include restaurant.name }
    end

    context 'when search by name' do
      before { get restaurants_path, params: { restaurant: { city_id: city.id, name: 'tacos kebab' } } }

      it { expect(response.body).to include restaurant.name }
      it { expect(response.body).not_to include vegan_restaurant.name }
    end
  end
end
