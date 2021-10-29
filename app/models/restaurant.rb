# frozen_string_literal: true

# Restaurant Model
class Restaurant < ApplicationRecord
  serialize :delivery, Array

  validates :name, length: { in: 3..40 }
  validates :kitchen, length: { in: 3..20 }

  belongs_to :city
  belongs_to :location
end
