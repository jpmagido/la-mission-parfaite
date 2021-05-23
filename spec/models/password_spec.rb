require 'rails_helper'

RSpec.describe Password, type: :model do
  let(:password) { build(:password) }
  let!(:password_input) { create(:password, content: 'private password')  }

  it 'should create a valid Password' do
    expect(password).to be_valid
  end

  describe '#is_equal_to()' do
    it { expect(password_input.is_equal_to?('private password')).to be_truthy }
    it { expect(password_input.is_equal_to?('false password')).to be_falsey }
  end

  context 'second same password is created' do
    let(:password) { 'blablabla' }
    let!(:original_password) { create(:password, content: password) }
    let(:twin_password) { create(:password, content: password) }

    it 'should raise error' do
      expect { twin_password }.to raise_error ActiveRecord::RecordNotUnique
    end
  end
end
