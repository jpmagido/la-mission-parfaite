require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  let(:restaurant) { create(:restaurant) }

  it { expect(restaurant).to be_valid }
  it { expect(restaurant.delivery).not_to be_empty }
  it { should belong_to(:city) }

end
