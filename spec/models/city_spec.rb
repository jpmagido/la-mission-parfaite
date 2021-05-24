require 'rails_helper'

RSpec.describe City, type: :model do
  let(:city) { create(:city) }

  it { expect(city).to be_valid }

  it { should validate_length_of(:name).is_at_least(3).is_at_most(10) }
end
