ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/rails'
require 'minitest/reporters'
require 'capybara/rails'
require 'database_cleaner'

Dir[Rails.root.join('test/support/**/*.rb')].each { |file| require file }

Minitest::Reporters.use!
DatabaseCleaner.strategy = :truncation

Capybara.current_driver = :webkit
Capybara::Webkit.configure do |config|
  config.block_unknown_urls
end

class ActiveSupport::TestCase
  include Capybara::DSL
  include Warden::Test::Helpers

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  # fixtures :all
  self.use_transactional_fixtures = false

  # Add more helper methods to be used by all tests here...
  setup do
    DatabaseCleaner.start
    Warden.test_mode!
  end

  teardown do
    DatabaseCleaner.clean
    Warden.test_reset!
  end
end

class ActionDispatch::IntegrationTest
  include Capybara::DSL
end
