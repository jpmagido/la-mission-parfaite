class RestaurantsController < ApplicationController
  helper_method :restaurant, :restaurants
  include RestaurantsHelper

  private

  def restaurants
    @restaurants ||= params['restaurant'] ? city_restaurants.where(query) : Restaurant.all.limit(100)
  end

  def restaurant
    @restaurant ||= restaurants.find(params[:id])
  end

  def city_restaurants
    @city_restaurants ||= City.find_by(id: params_restaurant[:city_id])&.restaurants || Restaurant.all
  end

  def query
    query = {}
    query[:vegan] = true if params_restaurant.has_key?(:vegan)
    query[:name] = params_restaurant[:name] if params_restaurant[:name].present?
    query
  end

  def name
    @name ||= params_restaurant[:name].downcase
  end

  def params_restaurant
    params.require(:restaurant).permit(:vegan, :city_id, :name)
  end
end


