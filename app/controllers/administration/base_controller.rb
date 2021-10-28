# frozen_string_literal: true

# Administration::BaseController
module Administration
  class BaseController < ApplicationController
    before_action :authenticate_admin!
  end
end
