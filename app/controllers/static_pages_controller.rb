class StaticPagesController < ApplicationController

  def home
    redirect_to root_path unless session_password_match?
  end

  def gateway
    redirect_to static_pages_home_path if session_password_match?
  end

  def disconnect
    reset_session
    redirect_to root_path
  end

  def check_password
    if ::AuthenticatorService.new(params[:password]).correct_password?
      session[:password] = params[:password]
      flash[:success] = 'Bienvenue sur le site des CDD :)'
      redirect_to static_pages_home_path
    else
      flash[:error] = 'Mot de passe incorrect'
      redirect_to root_path
    end
  end
end
