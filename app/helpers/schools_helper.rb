# -*- encoding : utf-8 -*-

module SchoolsHelper

  def province_filters
    provinces = Province.order("id").all
    select_choices = provinces.map { |p| [p.real_name,p.id.to_s]}
    select_tag "province", options_for_select(select_choices, params[:province]),{prompt: "院校省份"}
  end

  def professional_type_filters
    select_choices = professional_type_choices
    select_tag "professional_type", options_for_select(select_choices, params[:professional_type]),{prompt: "院校类型"}
  end

end
