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
      #parameter = params[:search].parameterize
      #@results = Restaurant.where(name: parameter)
      restaurants = City.find_by(name: params[:city])&.restaurants || Restaurant.all
      @results = restaurants.where(name: parameter, vegan: params[:vegan])

      #vegan true / false
      # conditions si pas de paramètres
      #@results = Restaurant.all.where("lower(name) LIKE :search OR lower(restaurant.city) LIKE :search", search: "%#{parameter}%")
    end
  end
end


