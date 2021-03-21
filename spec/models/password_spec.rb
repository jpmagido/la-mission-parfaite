require 'rails_helper'

RSpec.describe Password, type: :model do
  let(:password) { build_stubbed(:password)}
  it 'should create a valid Password' do
    expect(password).to be_valid
  end
end
