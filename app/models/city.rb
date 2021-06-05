class City < ApplicationRecord
  validates :name, presence: true
  validates_length_of :name, in: 3..20
end