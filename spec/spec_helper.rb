# frozen_string_literal: true

require 'pundit/matchers'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  Pundit::Matchers.configure do |pundit_config|
    pundit_config.user_alias = :admin
  end
end
