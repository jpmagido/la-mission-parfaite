class ApplicationController < ActionController::Base
  add_flash_types :success, :error

  def session_password_match?
    Password.user_password.is_equal_to?(session[:user_password])
  end

  def session_admin_password_match?
    Password.admin_password.is_equal_to?(session[:admin_password])
  end
end
