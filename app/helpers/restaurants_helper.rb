# frozen_string_literal: true

module RestaurantsHelper
   def is_vegan(restaurant)
    restaurant.vegan == true ? 'Végétarien' : 'Non Végétarien'
  end
end
