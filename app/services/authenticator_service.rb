class AuthenticatorService
 attr_reader :password_to_verify, :actual_password

 def initialize(password_to_verify)
  @password_to_verify = password_to_verify
  @actual_password = ENV['GLOBAL_PASSWORD']
 end

 def correct_password?
  password_to_verify == actual_password ? true : false
 end
end

