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
    @city_restaurants ||= City.find_by(id: params['restaurant'][:city_id])&.restaurants || Restaurant.all
  end

  def query
    query = {}
    query[:vegan] = true if params.has_key?(:vegan)
    query[:name] = params[:name] if params[:name].present?
    query
  end

  def name
    @name ||= params[:name].downcase
  end
end


