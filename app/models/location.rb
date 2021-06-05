class Location < ApplicationRecord
  belongs_to :city
  has_many :restaurants
end
