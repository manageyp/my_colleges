# -*- encoding : utf-8 -*-

require 'test_helper'

class ProvinceTest < ActiveSupport::TestCase
  test "should create provice" do
    p = Province.create_province(1, '上海')
    puts p.inspect
  end
end
