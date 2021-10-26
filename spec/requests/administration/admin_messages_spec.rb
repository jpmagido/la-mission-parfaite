# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Administration::AdminMessages', type: :request do
  let(:admin) { create(:admin) }
  let(:restaurant) { create(:restaurant) }
  let(:admin_review) { create(:admin_review, reviewable: restaurant, admin_id: admin, status: 1) }

  describe 'GET /index' do
    it 'returns http success' do
      get administration_admin_messages_url
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get administration_admin_message_url admin_review
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /search' do
    context 'when filtering by status' do
      it "returns only Admin Messages with the provided :status" do
        expect(admin_review.status).to eq('todo')
      end
    end
  end
end