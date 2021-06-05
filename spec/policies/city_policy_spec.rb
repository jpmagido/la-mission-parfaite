require 'rails_helper'

describe CityPolicy do
  subject { described_class.new(admin, city) }

  let(:city) { City.all.sample }

  context 'being a visitor' do
    let(:admin) { nil }

    it { is_expected.to forbid_action(:update) }
  end

  context 'being an administrator' do
    let(:admin) { create(:admin) }

    it { is_expected.to permit_action(:update) }
  end
end
