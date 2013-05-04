# -*- encoding : utf-8 -*-

module SchoolsHelper

  def province_filters
    provinces = Province.order("id").all
    select_choices = provinces.map { |p| [p.real_name,p.id.to_s]}
    selected_province = params[:province]
    select_tag "province", options_for_select(select_choices, selected_province),{prompt: "选择省份"}
    # columns = [{ :name => '全国', :filter => 'all'}]
    # provinces.each do |province|
    #   columns << { :name => province.real_name, :filter => "#{province.id}"}
    # end
    # filter_links("schools", "index", "province", columns)
  end

end
