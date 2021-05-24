class CitiesController < ApplicationController
  helper_method :city, :cities

  def update
    authorize city

    city.update!(params_city)
    redirect_to city_path city
  end

  private

  def params_city
    params.require(:city).permit(:name)
  end

  def cities
    @cities ||= City.all
  end

  def city
    @city ||= City.find params[:id]
  end
end
