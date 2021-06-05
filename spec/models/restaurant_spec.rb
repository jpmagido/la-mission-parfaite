require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  let(:restaurant) { create(:restaurant) }

  it { expect(restaurant).to be_valid }
  it { expect(restaurant.delivery).not_to be_empty }
  it { should belong_to(:city) }

  it { should validate_length_of(:name).is_at_least(3).is_at_most(20) }
  it { should validate_length_of(:kitchen).is_at_least(3).is_at_most(20) }
end