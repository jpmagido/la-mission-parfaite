require 'rails_helper'

RSpec.describe Admin, type: :model do
  let(:admin) { build_stubbed(:admin)}
  it 'should create a valid admin' do
    expect(admin).to be_valid
  end
end
