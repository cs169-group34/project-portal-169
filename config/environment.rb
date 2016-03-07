# Start CodeClimate
require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start

# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!
