class Restaurant < ApplicationRecord
  serialize :delivery, Array

  validates_length_of :name, in: 3..20
  validates_length_of :kitchen, in: 3..20

  belongs_to :city
  belongs_to :location
end
