class Location < ApplicationRecord
  validates_length_of :address, in: 3..40
  validates_length_of :street_number, in: 1..10
  validates_length_of :zip_code, in: 3..20

  belongs_to :city
  has_many :restaurants
end