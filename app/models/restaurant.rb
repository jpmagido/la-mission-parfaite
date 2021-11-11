# frozen_string_literal: true

# Restaurant Model
class Restaurant < ApplicationRecord
  serialize :delivery, Array

  validates :name, length: { in: 2..40 }
  validates :kitchen, length: { in: 2..40 }

  belongs_to :city
  belongs_to :location
  has_many :admin_reviews, as: :reviewable
end
