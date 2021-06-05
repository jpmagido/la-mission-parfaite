require 'rails_helper'

RSpec.describe Location, type: :model do
  let(:location) { create(:location) }

  it { expect(location).to be_valid }
  it { should belong_to(:city) }
  it { should have_many(:restaurants) }
end
