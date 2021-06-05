class Restaurant < ApplicationRecord
  belongs_to :city
  belongs_to :location
end
