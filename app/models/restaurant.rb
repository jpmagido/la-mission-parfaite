class Restaurant < ApplicationRecord
  serialize :delivery, Array

  belongs_to :city
  belongs_to :location
end
