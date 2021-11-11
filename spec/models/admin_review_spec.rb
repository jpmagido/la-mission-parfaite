require 'rails_helper'

RSpec.describe AdminReview, type: :model do
  let(:admin_review) { create(:admin_review) }
  let(:admin_review_named) { create(:admin_review, first_name: 'Léopold', last_name: 'Sédar Senghor') }

  it { expect(admin_review).to be_valid }
  it { should belong_to(:reviewable) }
  it { should belong_to(:admin).optional }

  it { should validate_length_of(:email).is_at_least(1).is_at_most(100) }
  it { should validate_length_of(:first_name).is_at_least(2).is_at_most(100) }
  it { should validate_length_of(:last_name).is_at_least(2).is_at_most(100) }
  it { should validate_length_of(:comment).is_at_least(2).is_at_most(1000) }

  # Methods
  it 'returns full_name' do
    expect(admin_review_named.full_name).to eq 'Léopold Sédar Senghor'
  end
end
