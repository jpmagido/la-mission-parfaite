# frozen_string_literal: true

class Restaurant < ApplicationRecord
  serialize :delivery, Array

  validates_length_of :name, in: 3..40
  validates_length_of :kitchen, in: 3..20

  belongs_to :city
  belongs_to :location
  has_many :admin_reviews, as: :reviewable
end
