class RestaurantsController < ApplicationController
  helper_method :restaurant, :restaurants
  include RestaurantsHelper

  private

  def city_restaurants
    @city_restaurants ||= City.find_by(id: params['Restaurant'][:city_id])&.restaurants || Restaurant.all
  end

  def query
    query = {}
    query[:vegan] = true if params.has_key?(:vegan)
    query[:name] = params[:name] if params[:name].present?
    query
  end

  def restaurants
    @restaurants ||=
      begin
        if params['Restaurant']
          city_restaurants.where query
        else
          Restaurant.where query
        end
      end
  end

  def restaurant
    @restaurant ||= restaurants.find(params[:id])
  end

  def name
    @name ||= params[:name].downcase
  end

  # def valid_params
  #   restaurant_params.delete_if { |_, value| value.empty? }
  # end

  # def restaurant_params
  #   params.permit(:name, :vegan, city_restaurants: {})
  # end
end


