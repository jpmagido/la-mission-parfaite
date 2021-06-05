class City < ApplicationRecord
  has_many :locations
  has_many :restaurants
  
  validates :name, presence: true
  validates_length_of :name, in: 3..20
end
