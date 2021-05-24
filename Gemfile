source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.0'

# CORE
gem 'rails', '~> 6.1.3'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'devise', '~> 4.7', '>= 4.7.3'
# gem 'redis', '~> 4.0'

#SUPPORT
gem 'bootsnap', '>= 1.4.4', require: false
gem 'dotenv-rails', '~> 2.7', '>= 2.7.6'
gem 'enumerize', '~> 2.4'
gem 'jbuilder', '~> 2.7'
gem 'rexml', '~> 3.2', '>= 3.2.4'
gem 'turbolinks', '~> 5'
gem 'bcrypt', '~> 3.1', '>= 3.1.16'

# Style
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 5.0'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails', '~> 5.0', '>= 5.0.1'
  gem 'factory_bot_rails', '~> 6.1'
  gem 'shoulda-matchers', '~> 4.5', '>= 4.5.1'
  gem 'ffaker', '~> 2.18'
  gem 'database_cleaner-active_record', '~> 2.0'
end

group :development do
  gem 'better_errors', '~> 2.9', '>= 2.9.1'
  gem 'binding_of_caller', '~> 1.0'
  gem 'web-console', '>= 4.1.0'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  gem 'spring'
end

group :test do
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
