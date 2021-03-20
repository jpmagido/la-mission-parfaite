require 'rails_helper'

RSpec.describe AuthenticatorService do
  let(:correct_auth) { AuthenticatorService.new(ENV['GLOBAL_PASSWORD']) }
  let(:wrong_auth) { AuthenticatorService.new(SecureRandom.hex) }

  it 'should return false' do
    expect(wrong_auth.correct_password?).to be_falsey
  end

  it 'should return true' do
    expect(correct_auth.correct_password?).to be_truthy
  end
end
