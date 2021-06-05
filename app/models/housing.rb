class Housing < ApplicationRecord
  belongs_to :city
  belongs_to :location

  enum housing_type: { hotel: 0, air_bnb_shared: 1, air_bnb_full: 2, cottage: 3, other: 4 }
end
