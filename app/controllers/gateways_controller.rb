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
    auth = ::AuthenticatorService.new(params[:password])
    if params[:admin] == 'true' && auth.correct_admin_password?
      session[:admin_password] = params[:password]
      redirect_to new_admin_registration_path, success: 'Bienvenue sur la partie Admin'
    elsif auth.correct_password?
      session[:user_password] = params[:password]
      redirect_to static_pages_home_path, success: 'Bienvenue sur le site des CDD'
    else
      redirect_to root_path, alert: 'Mauvais Mot de Passe :/'
    end
  end
end
