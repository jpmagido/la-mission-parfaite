class StaticPagesController < ApplicationController
  before_action :home_redirection

  def home

  end

  def refund

  end

  private

  def home_redirection
    redirect_to root_path unless session_password_match?
  end
end
