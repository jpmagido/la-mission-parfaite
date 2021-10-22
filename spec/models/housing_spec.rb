# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Housing, type: :model do
  let(:housing) { create(:housing) }

  it { expect(housing).to be_valid }
  it { should belong_to(:city) }
  it { should belong_to(:location) }
  it { should define_enum_for(:housing_type).with_values([:hotel, :air_bnb_shared ,:air_bnb_full, :cottage, :other]) }
end
