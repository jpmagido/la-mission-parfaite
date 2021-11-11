# frozen_string_literal: true

# City Model
class City < ApplicationRecord
  has_many :locations
  has_many :restaurants

  validates :name, presence: true, uniqueness: true
  validates :name, length: { in: 3..50 }

  def self.cities_for_select
    all.map do |city|
      [city.name, city.id]
    end
  end
end
