# frozen_string_literal: true

# Policies City
class CityPolicy < ApplicationPolicy

  def update?
    !user.nil?
  end
end
