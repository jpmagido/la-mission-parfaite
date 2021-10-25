# frozen_string_literal: true

class HousingsController < ApplicationController
  helper_method :housing, :housings

  def index
    @housings ||= Housing.search_and_paginate(params, per_page: 20).order(updated_at: :desc)
  end

  private

  def params_housing
    params.require(:housing).permit(:breakfast, :url, :housing_type)
  end
  
  #def housings
  #  @housings ||= Housing.all
  #end
  
  def housing
    @housing ||= Housing.find params[:id]
  end
  
end
