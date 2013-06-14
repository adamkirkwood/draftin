require 'simplecov'
SimpleCov.start

require 'draftin'

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end