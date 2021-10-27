# frozen_string_literal: true

class City < ApplicationRecord
  has_many :locations
  has_many :restaurants
  has_many :housings

  validates :name, presence: true
  validates_length_of :name, in: 3..20

  def count_restaurants
    Restaurant.where(:city_id => self.id).count
  end

  def count_housings
    Housing.where(:city_id => self.id).count
  end  
end
