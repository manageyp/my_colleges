# -*- encoding : utf-8 -*-

module MajorsHelper

  def college_type_filters
    select_choices = [['本科','本科'],['专科','专科']]
    select_tag "college_type", options_for_select(select_choices, params[:college_type]),{prompt: "专业层次"}
  end

  def parent_major_filters
    majors = Major.where("id <= 30").order("id").all
    select_choices = majors.map { |p| [p.name,p.id.to_s]}
    select_tag "parent_id", options_for_select(select_choices, params[:parent_id]),{prompt: "专业分类"}
  end

  def major_icon(index)
    case index
    when 0
      "Chat@2x.png"
    when 1
      "Clipboard@2x.png"
    when 2
      "Map@2x.png"
    else
      "Watches@2x.png"
    end
  end

end