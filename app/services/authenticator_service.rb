require 'bcrypt'

class AuthenticatorService
  attr_reader :password_to_verify

  def initialize(password_to_verify)
    @password_to_verify = password_to_verify
  end

  def correct_password?
    Password.user_password.is_equal_to?(password_to_verify)
  end

  def correct_admin_password?
    Password.admin_password.is_equal_to?(password_to_verify)
  end
end
