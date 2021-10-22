# frozen_string_literal: true

class CityPolicy < ApplicationPolicy

  def update?
    !user.nil?
  end
end
