# -*- encoding : utf-8 -*-

require 'test_helper'

class SchoolTest < ActiveSupport::TestCase
  
  test "should build domestic scholl" do
    params = { :province_name => "江苏", :college_type => "本科",
               :nick_name => "南通大学", :web_site => "http://www.ntu.edu.cn",
               :ifeng_code => 1322 }
    province = Province.new(:id => 1, :country_id => 1)
    Province.stubs(:get_by_name).returns(province)
    school = School.build_ifeng_domestic(params)
    puts school.inspect
    assert_not_nil school
  end
end
