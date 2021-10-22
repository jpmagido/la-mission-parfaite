# frozen_string_literal: true

class GatewaysController < ApplicationController
  def user
    redirect_to static_pages_home_path if session_password_match?
  end

  def admin
    redirect_to new_admin_registration_path if session_admin_password_match?
  end

  def disconnect
    reset_session
    redirect_to root_path, notice: 'Vous avez été déconnecté'
  end

  def check_password
    case
    when params[:admin] == 'true' && admin_password.is_equal_to?(input_password)
      session[:admin_password] = input_password
      redirect_to new_admin_session_path, success: 'Bienvenue sur la partie Admin'

    when user_password.is_equal_to?(input_password)
      session[:user_password] = input_password
      redirect_to static_pages_home_path, success: 'Bienvenue sur le site des CDD'

    else
      redirect_to root_path, alert: 'Mauvais Mot de Passe :/'
    end
  end

  private

  def admin_password
    Password.admin_password
  end

  def user_password
    Password.user_password
  end

  def input_password
    params[:password]
  end
end
