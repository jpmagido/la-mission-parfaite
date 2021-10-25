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

end
