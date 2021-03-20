class ApplicationController < ActionController::Base

  def session_password_match?
    ::AuthenticatorService.new(session[:user_password]).correct_password?
  end

  def session_admin_password_match?
    ::AuthenticatorService.new(session[:admin_password]).correct_admin_password?
  end
end
