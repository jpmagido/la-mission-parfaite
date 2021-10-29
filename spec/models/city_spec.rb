# frozen_string_literal: true

require 'rails_helper'

RSpec.describe City, type: :model do
  let(:city) { create(:city) }

  it { expect(city).to be_valid }
  it { should validate_length_of(:name).is_at_least(3).is_at_most(20) }

  describe "City.cities_for_select" do
    xit "return array of [city.name, city.id]" do
      array = City.cities_for_select
      expect(City.cities_for_select).to eq(['Ajaccio', 1])
    end
  end
end
