class RestaurantsController < ApplicationController
  helper_method :restaurant, :restaurants

  def search
    #bonjour = valid_params.to_h
    #bonjour.select.with_index { |_, i| i < bonjour.count - 1 }.each { |key, _| query[key] = self.send(key) }

    query = {}
    if params.has_key?(:vegan)
      query[:vegan] = true
    end
    if params[:name] != ""
      query[:name] = params[:name]
    end
    @results = city_restaurants.where(query)
  end

  private

  def restaurants
    @restaurants ||= Restaurant.all
  end

  def restaurant
    @restaurant ||= restaurants.find(params[:id])
  end

  def city_restaurants
    @city_restaurants ||= City.find_by(id: params[:city_restaurants][:city_id])&.restaurants || Restaurant.all
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


