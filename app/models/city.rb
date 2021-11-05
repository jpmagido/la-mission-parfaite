# frozen_string_literal: true

# City Model
class City < ApplicationRecord
  has_many :locations
  has_many :restaurants
  has_many :housings

  validates :name, presence: true
  validates :name, length: { in: 3..20 }

  def self.cities_for_select
    all.map do |city|
      [city.name, city.id]
    end
  end
end
