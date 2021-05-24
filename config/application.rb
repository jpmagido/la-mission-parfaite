require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module LaMissionParfaite
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1
    config.generators.helper = false
    config.generators.assets = false

    config.generators do |g|
      g.test_framework :rspec,
                       :view_specs => false,
                       :request_specs => true
    end

    config.time_zone = 'Paris'
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
