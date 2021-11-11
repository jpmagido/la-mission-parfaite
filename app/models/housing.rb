# frozen_string_literal: true

# Housing Model
class Housing < ApplicationRecord
  belongs_to :city
  belongs_to :location

  enum housing_type: { hotel: 0, air_bnb_shared: 1, air_bnb_full: 2, cottage: 3, other: 4 }
  has_many :admin_reviews, as: :reviewable

  def breakfast_french
    I18n.t("activerecord.attributes.housing.breakfast.#{self.breakfast}")
  end
  
  def housing_type_french
    I18n.t("activerecord.attributes.housing.housing_types.#{self.housing_type}")
  end

  def self.search_and_paginate(params, per_page: 48)
    ::Search::Housing.filter_search(self, params).paginate(page: params[:page].to_i, per_page: per_page)
  rescue StandardError
    ::Search::Housing.filter_search(self, params).paginate(page: 1, per_page: per_page)
  end
end
