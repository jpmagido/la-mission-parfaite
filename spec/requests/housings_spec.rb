# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Housings', type: :request do
  let(:housing) { create(:housing) }

  describe 'GET /index' do
    it 'returns http success' do
      get housings_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get housing_path housing
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /search' do
    context 'when search by breakfast' do
      let(:city) { create(:city) }
      let!(:house) { create(:housing, breakfast: true, city: city) }

      it 'return housings with breakfast' do
        get housings_path, params: { breakfast: true }
        expect(response.body).to include house.breakfast.to_s
        expect(response).to have_http_status(:success)
      end
    end

    context 'when search by city' do
      let(:city) { create(:city, name: 'Toulouse') }
      let!(:house) { create(:housing, city: city) }

      it 'return Housings in Toulouse' do
        get housings_path, params: { city: 'Toulouse' }
        expect(response.body).to include house.city.name.to_s
        expect(response).to have_http_status(:success)
      end
    end

    context 'when search by housing_type' do
      let(:city) { create(:city) }
      let!(:house) { create(:housing, breakfast: true, city: city, housing_type: 2) }

      it 'return Housings which are full air bnb' do
        get housings_path, params: { housing_type: 2 }
        expect(response.body).to include house.housing_type.to_s
        expect(response).to have_http_status(:success)
      end
    end    
  end
end
