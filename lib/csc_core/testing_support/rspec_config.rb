require 'factory_bot_rails'
require 'shoulda/matchers'
require 'database_cleaner'
require 'ffaker'
require "carrierwave/test/matchers"
require "sidekiq/testing"
require "rspec-sidekiq"
require 'byebug'

require_relative 'support/factory_bot'
require_relative "factories"
