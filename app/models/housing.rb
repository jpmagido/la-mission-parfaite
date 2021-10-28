# frozen_string_literal: true

# Housing Model
class Housing < ApplicationRecord
  belongs_to :city
  belongs_to :location

  enum housing_type: { hotel: 0, air_bnb_shared: 1, air_bnb_full: 2, cottage: 3, other: 4 }

  def self.search_and_paginate(params, per_page: 48)
    ::Search::Housing.filter_search(self, params).paginate(page: params[:page].to_i, per_page: per_page)
  rescue StandardError
    ::Search::Housing.filter_search(self, params).paginate(page: 1, per_page: per_page)
  end
end
