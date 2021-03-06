#require "codeclimate-test-reporter"
#CodeClimate::TestReporter.start

ENV['RACK_ENV'] = 'test'
require './lib/app'
require 'helpers/user'
require 'helpers/listing'
require 'sinatra'
require 'capybara/rspec'
require 'database_cleaner'
require 'dotenv'
Dotenv.load

Capybara.app = Oodls

RSpec.configure do |config|

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.before(:all) do 
    Excon.defaults[:mock] = true
    Excon.stub({}, {body: '{}', status: 200})
  end

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

end
