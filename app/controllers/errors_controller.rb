class ErrorsController < ApplicationController
  helper_method :errors

  private

  def errors
    params[:errors]
  end
end
