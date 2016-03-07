# Start CodeClimate
if Rails.env.test?
    require 'codeclimate-test-reporter'
    CodeClimate::TestReporter.start
end

# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!
