require 'rails_helper'

RSpec.describe Location, type: :model do
  let(:location) { create(:location) }

  it { expect(location).to be_valid }
  it { should belong_to(:city) }
  it { should have_many(:restaurants) }

  it { should validate_length_of(:address).is_at_least(3).is_at_most(40) }
  it { should validate_length_of(:street_number).is_at_least(1).is_at_most(10) }
  it { should validate_length_of(:zip_code).is_at_least(3).is_at_most(20) }
end
