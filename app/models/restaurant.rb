# frozen_string_literal: true

class Restaurant < ApplicationRecord
  serialize :delivery, Array

  validates_length_of :name, in: 2..40
  validates_length_of :kitchen, in: 2..20

  belongs_to :city
  belongs_to :location
end
