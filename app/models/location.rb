# frozen_string_literal: true

# Location Model
class Location < ApplicationRecord
  validates :address, length: { in: 3..40 }
  validates :street_number, length: { in: 1..10 }
  validates :zip_code, length: { in: 3..20 }

  belongs_to :city
  has_many :restaurants, dependent: :destroy

  def full_address
    "#{self.street_number} #{self.address} #{self.zip_code}"
  end
end
