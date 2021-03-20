class GatewaysController < ApplicationController
  def user
    redirect_to static_pages_home_path if session_password_match?
  end

  def admin
    redirect_to new_admin_registration_path if session_admin_password_match?
  end

  def disconnect
    reset_session
    flash[:alert] = 'Vous avez été déconnecté'
    redirect_to root_path
  end

  def check_password
    auth = ::AuthenticatorService.new(params[:password])
    if params[:admin] == 'true' && auth.correct_admin_password?
      session[:admin_password] = params[:password]
      flash[:success] = 'Bienvenue sur la partie Admin'
      redirect_to new_admin_registration_path
    elsif auth.correct_password?
      session[:user_password] = params[:password]
      flash[:success] = 'Bienvenue sur le site des CDD'
      redirect_to static_pages_home_path
    else
      flash[:error] = 'Une erreur est survenue :/'
      redirect_to root_path
    end
  end
end
