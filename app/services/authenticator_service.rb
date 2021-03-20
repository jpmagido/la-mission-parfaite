class AuthenticatorService

 def initialize(password_to_verify)
  @password_to_verify = password_to_verify
 end

 def verify_password
  @password_to_verify == 'reblochonetfoiegras' ? true : false
 end

end

