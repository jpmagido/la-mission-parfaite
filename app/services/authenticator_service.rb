require 'bcrypt'

class AuthenticatorService
  attr_reader :password_to_verify, :app_password, :admin_password

  def initialize(password_to_verify)
    @password_to_verify = password_to_verify
    @app_password = ENV['GLOBAL_PASSWORD']
    @admin_password = ENV['ADMIN_PASSWORD']
    #@app_password = Password.user_password.first.send('decrypt!')
    #@admin_password = Password.admin_password.first.send('decrypt!')
  end

  def correct_password?
    password_to_verify == app_password ? true : false
  end

  def correct_admin_password?
    password_to_verify == admin_password ? true : false
  end
end

