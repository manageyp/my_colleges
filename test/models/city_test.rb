# -*- encoding : utf-8 -*-

require 'test_helper'

class CityTest < ActiveSupport::TestCase
  test "should create city" do
    p = City.create_city(1, '上海')
    puts p.inspect
  end
end
