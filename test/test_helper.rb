ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)

require "minitest/autorun"
require "minitest/rails"

MiniTest::Rails.override_testunit!

class ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods
end