# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RestaurantsHelper, type: :helper do
  let(:restaurant_vegan) { create(:restaurant, vegan: true) }
  let(:restaurant) { create(:restaurant, vegan: false) }

  it 'returns vegan' do
    expect(helper.is_vegan(restaurant_vegan)).to eq('Végétarien')
  end

  it 'returns non vegan' do
    expect(helper.is_vegan(restaurant)).to eq('Non Végétarien')
  end
end
