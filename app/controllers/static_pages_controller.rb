class StaticPagesController < ApplicationController

  def home
    redirect_to root_path unless session_password_match?
  end
end
