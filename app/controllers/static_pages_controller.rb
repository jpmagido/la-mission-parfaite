class StaticPagesController < ApplicationController
  def home
  end

  def gateway

  end

  def check_password
    password_to_verify = params[:password]

    authentification = ::AuthenticatorService.new(password_to_verify)

    if authentification.verify_password
      redirect_to static_pages_home_path
    else
      flash[:error] = 'erreur de mot de passe'
      redirect_to root_path
    end
  end
end
