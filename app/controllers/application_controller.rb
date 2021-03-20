class ApplicationController < ActionController::Base

  private

  def session_password_match?
    ::AuthenticatorService.new(session[:password]).correct_password?
  end
end
