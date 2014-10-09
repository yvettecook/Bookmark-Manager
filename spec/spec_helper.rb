ENV["RACK_ENV"] = 'test'

require './app/router'
require 'user'
require 'database_cleaner'
require 'capybara/rspec'



Capybara.app = Sinatra::Application.new


RSpec.configure do |config|
  
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.expect_with :rspec do |expectations|

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

    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

 
  config.mock_with :rspec do |mocks|
    
    mocks.verify_partial_doubles = true
  end

end
