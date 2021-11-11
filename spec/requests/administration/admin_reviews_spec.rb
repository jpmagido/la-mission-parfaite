# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Administration::AdminReviews', type: :request do
  before { sign_in admin }

  let(:admin) { create(:admin) }
  let(:restaurant) { create(:restaurant) }
  let!(:admin_review) { create(:admin_review, reviewable: restaurant, admin_id: admin, status: 1) }

  describe 'GET /index' do
    it 'returns http success' do
      get administration_admin_reviews_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get administration_admin_review_path admin_review
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /edit' do
    it 'returns http success' do
      get edit_administration_admin_review_path admin_review
      expect(response).to have_http_status(:success)
    end
  end

  describe 'PATCH /update' do
    it 'updates admin_review' do
      new_first_name = 'booba'
      patch administration_admin_review_path(admin_review), params: { admin_review: { first_name: new_first_name } }

      expect(admin_review.reload.first_name).to eq new_first_name
    end

    it 'redirects to SHOW' do
      expect(patch administration_admin_review_path(admin_review), params: { admin_review: { first_name: 'booba' } })
        .to redirect_to administration_admin_review_path admin_review
    end
  end
end
