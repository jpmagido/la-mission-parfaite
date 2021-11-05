# frozen_string_literal: true

# Location Model
class Location < ApplicationRecord
  validates :address, length: { in: 3..40 }
  validates :street_number, length: { in: 1..10 }
  validates :zip_code, length: { in: 3..20 }

  belongs_to :city
  has_many :restaurants, dependent: :destroy
  has_many :housings, dependent: :destroy

  def full_address
    [street_number, address, zip_code, city.name].compact.join(' ')
  end
end
