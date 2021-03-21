require 'rails_helper'

RSpec.describe AuthenticatorService do
  let!(:user_password) { create(:password, auth_level: :user, content: 'password-user') }

  let(:correct_auth) { AuthenticatorService.new('password-user') }
  let(:wrong_auth) { AuthenticatorService.new(SecureRandom.hex) }

  it 'should return false' do
    expect(wrong_auth.correct_password?).to be_falsey
  end

  it 'should return true' do
    expect(correct_auth.correct_password?).to be_truthy
  end
end
