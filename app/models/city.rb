# frozen_string_literal: true

class City < ApplicationRecord
  has_many :locations
  has_many :restaurants
  
  validates :name, presence: true
  validates_length_of :name, in: 3..20

  def self.cities_for_select
    all.map do |city|
      [city.name, city.id]
    end
  end
end
