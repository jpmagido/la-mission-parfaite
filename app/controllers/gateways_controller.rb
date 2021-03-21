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
    password_to_verify = params[:password]
    admin_password = Password.admin_password
    user_password = Password.user_password

    if params[:admin] == 'true' && admin_password.is_equal_to?(password_to_verify)
      session[:admin_password] = params[:password]
      redirect_to new_admin_registration_path, success: 'Bienvenue sur la partie Admin'
    elsif user_password.is_equal_to?(password_to_verify)
      session[:user_password] = params[:password]
      redirect_to static_pages_home_path, success: 'Bienvenue sur le site des CDD'
    else
      redirect_to root_path, alert: 'Mauvais Mot de Passe :/'
    end
  end
end
