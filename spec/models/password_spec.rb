require 'rails_helper'

RSpec.describe Password, type: :model do
  let(:password) { build(:password) }

  it 'should create a valid Password' do
    expect(password).to be_valid
  end

  context 'second same password is created' do
    let(:password) { 'blablabla'}
    let!(:original_password) { create(:password, content: password) }
    let(:twin_password) { create(:password, content: password) }

    it 'should raise error' do
      expect { twin_password }.to raise_error ActiveRecord::RecordNotUnique
    end
  end
end
