# frozen_string_literal: true
require "simplecov"
SimpleCov.start "rails"

ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"

module ActiveSupport
  # test case
  class TestCase
    fixtures :all
  end
end
