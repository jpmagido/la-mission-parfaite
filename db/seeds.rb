# frozen_string_literal: true

@city_1 = City.last
@city_2 = City.first

def create_locations
  @location_1 = Location.create!(
    address: 'rue du moulin',
    street_number: '30',
    zip_code: '83400',
    city_id: @city_1.id
  )
  @location_2 = Location.create!(
    address: 'avenue Carmen',
    street_number: '75',
    zip_code: '35200',
    city_id: @city_2.id
  )
end

def create_restaurants
  Restaurant.create!(
    name: 'la galinette',
    kitchen: 'cuisine du Sud-Ouest',
    vegan: false,
    city_id: @city_1.id,
    location_id: @location_1.id
  )
  Restaurant.create!(
    name: 'La voile bleue',
    kitchen: 'cuisine du marché',
    vegan: true,
    city_id: @city_2.id,
    location_id: @location_2.id
  )
end

def create_admin_reviews
  AdminReview.create!(
    first_name: "Admin1",
    last_name: "Review1",
    email: "admin1@mail.fr",
    comment: "Commentaire du Premier admin message",
    status: 1,
    admin_id: Admin.last.id,
    reviewable_type: "Restaurant",
    reviewable_id: Restaurant.last.id
  )
  AdminReview.create!(
    first_name: "Admin2",
    last_name: "Review2",
    email: "admin2@mail.fr",
    comment: "Commentaire du Second admin message",
    status: 2,
    admin_id: Admin.last.id,
    reviewable_type: "Housing",
    reviewable_id: Housing.last.id
  )
end

def destroy_all_model
  Restaurant.destroy_all
  Location.destroy_all
  AdminReview.destroy_all
  p 'All model destroyed :)'
end

def perform
  #destroy_all_model
  #create_locations
  #create_restaurants
  AdminReview.destroy_all
  create_admin_reviews
  p 'seed done'
end

perform
