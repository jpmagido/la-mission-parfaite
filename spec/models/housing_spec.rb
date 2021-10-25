# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Housing, type: :model do
  let(:housing) { create(:housing) }

  it { expect(housing).to be_valid }
  it { should belong_to(:city) }
  it { should belong_to(:location) }
  it { should define_enum_for(:housing_type).with_values([:hotel, :air_bnb_shared ,:air_bnb_full, :cottage, :other]) }

  describe 'Housing.search_and_paginate' do
    let(:params) { { housing: { url: 'www.google.fr' }, page: '1' } }

    it 'calls ::Search::Housing' do
      allow(::Search::Housing).to receive(:filter_search).with(Housing, params).and_return Housing.all

      ::Housing.search_and_paginate params

      expect(::Search::Housing).to have_received(:filter_search).with(Housing, params)
    end
  end
end
