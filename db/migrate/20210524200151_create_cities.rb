class CreateCities < ActiveRecord::Migration[6.1]
  def change
    create_table :cities do |t|
      t.string :name

      t.timestamps
    end

    create_cities
  end

  def create_cities
    array_cities = %w[Ajaccio Amiens Antibes Besançon Bordeaux Caen Clermont-Ferrand Dijon Grenoble Lille Limoges Lyon Marseille
    Montpellier Nancy Nantes Orléans Poitiers Reims Rennes Rouen Strasbourg Toulouse].freeze

    array_cities.each { |city_name| City.create!(name: city_name) }
  end
end