# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
    Location.destroy_all
    Location.create!(
      address: 'rue du moulin',
      street_number: '30',
      zip_code: '83400',
      city_id: 4
      )
    Location.create!(
      address: 'avenue Carmen',
      street_number: '75',
      zip_code: '35200',
      city_id: 2
    )
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

