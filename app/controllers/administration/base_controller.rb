# frozen_string_literal: true

module Administration
  # Administration::BaseController
  class BaseController < ApplicationController
    before_action :authenticate_admin!
  end
end
