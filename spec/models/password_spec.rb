require 'rails_helper'

RSpec.describe Password, type: :model do
  let!(:password) { create(:password) }
  let(:twin_password) { create(:password) }

  it 'should create a valid Password' do
    expect(password).to be_valid
  end

  it 'should raise error' do
    expect { twin_password }.to raise_error ActiveRecord::RecordNotUnique
  end
end
