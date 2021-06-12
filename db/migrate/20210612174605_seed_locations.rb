class SeedLocations < ActiveRecord::Migration[6.1]
  def change
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
      city_id: 2)
  end
end
