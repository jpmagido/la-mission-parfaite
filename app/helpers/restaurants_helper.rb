module RestaurantsHelper
   def is_vegan(restaurant)
    restaurant.vegan == true ? 'vegan' : 'pas vegan friendly'
  end
end
