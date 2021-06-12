class SeedRestaurants < ActiveRecord::Migration[6.1]
  def change
    Restaurant.destroy_all
    Restaurant.create!(
      name: 'la galinette',
      kitchen: 'cuisine du Sud-Ouest',
      vegan: false,
      city_id: 3,
      location_id: 1
      )
    Restaurant.create!(
      name: 'La voile bleue',
      kitchen: 'cuisine du marché',
      vegan: true,
      city_id: 2,
      location_id: 2
      )
  end
end
