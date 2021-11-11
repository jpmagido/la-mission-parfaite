# frozen_string_literal: true

require 'rails_helper'

RSpec.describe City, type: :model do
  let(:city) { create(:city) }
  let!(:cities) { create_list(:city, 2)}

  it { expect(city).to be_valid }
  it { should validate_length_of(:name).is_at_least(3).is_at_most(50) }
  it { should validate_uniqueness_of(:name) }

  describe "City.cities_for_select" do
    it "return array of [city.name, city.id]" do
      expect(City.cities_for_select).to be_a Array
      expect(City.cities_for_select.sample).to be_a Array
      expect(City.cities_for_select.sample.count).to eq 2
      expect(City.cities_for_select.sample.first).to be_a String
      expect(City.find_by_name(City.cities_for_select.sample.first)).to be_a City
      expect(City.find(City.cities_for_select.sample.last)).to be_a City
      expect(City.cities_for_select.sample.last).to be_a Integer
    end
  end
end
