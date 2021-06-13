class RestaurantsController < ApplicationController
  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def index
    @restaurants = Restaurant.all
  end

  def search
    if params[:search].blank?
      redirect_to restaurants_path
    else
      parameter = params[:search].downcase
      @results = Restaurant.where(name: parameter)
      # @results = Restaurant.all.where("lower(name) LIKE :search OR lower(restaurant.city) LIKE :search", search: "%#{parameter}%")
    end
  end

end


