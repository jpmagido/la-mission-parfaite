require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module LaMissionParfaite
  # Application 
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1
    config.generators.helper = false
    config.generators.assets = false

    config.generators do |g|
      g.test_framework :rspec,
                      view_specs: false,
                      request_specs: true
    end

    config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}')]
    config.i18n.default_locale = :fr
    
    config.time_zone = 'Paris'
    # config.eager_load_paths << Rails.root.join('extras')
  end
end
