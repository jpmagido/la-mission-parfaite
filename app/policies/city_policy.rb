class CityPolicy < ApplicationPolicy

  def update?
    !user.nil?
  end
end
