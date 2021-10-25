require 'rails_helper'

RSpec.describe AdminReview, type: :model do
  let(:admin) { create(:admin) }
  let(:restaurant) { create(:restaurant) }
  let(:admin_review) { 
    create(
      :admin_review, 
      reviewable: restaurant,
      admin_id: admin
    ) 
  }

  it { expect(admin_review).to be_valid }
  it { should belong_to(:admin).optional }

  it { should validate_length_of(:email).is_at_least(1).is_at_most(100) }
  it { should validate_length_of(:first_name).is_at_least(2).is_at_most(100) }
  it { should validate_length_of(:last_name).is_at_least(2).is_at_most(100) }
  it { should validate_length_of(:comment).is_at_least(2).is_at_most(100) }
end
