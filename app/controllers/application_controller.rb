# frozen_string_literal: true

class ApplicationController < ActionController::Base
  rescue_from Pundit::NotAuthorizedError, with: :render_401

  include Pundit

  add_flash_types :success, :error

  def session_password_match?
    Password.user_password.is_equal_to?(session[:user_password])
  end

  def session_admin_password_match?
    Password.admin_password.is_equal_to?(session[:admin_password])
  end

  def pundit_user
    current_admin
  end

  def render_401(err)
    redirect_to unauthorized_path(errors: err)
  end
end
