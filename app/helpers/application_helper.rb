# -*- encoding : utf-8 -*-

module ApplicationHelper

  def chinese_pagination(collection)
    options = { previous_label: "上一页",
                next_label: "下一页" }
    will_paginate(collection, options)
  end

  def filter_links(controller_name, action_name, field, columns)
    return_links = ""

    columns.each_with_index do |column, index|
      link = link_to column[:name],filter_options(controller_name, action_name, field, column),
                     :class => filter_link_css(field, column)
      return_links << "#{link}&nbsp;&nbsp;"
      if index > 0 && ((index + 1) % 5 == 0)
        return_links << "<br />"
      end
    end

    return_links.html_safe
  end

  def filter_options(controller_name, action_name, field, column)
    new_params = Marshal.load(Marshal.dump(params))

    if filter_present?(field)
      new_params[:q][field.to_sym] = column[:filter]
    else
      new_params.update( "q[#{field}]" => column[:filter])
    end

    new_params.merge!(controller: controller_name, action: action_name)
    url_for(new_params)
  end

  def filter_link_css(field, column)
    if is_current_filter?(field, column)
      'btn btn-danger'
    else
      'btn'
    end
  end

  def is_current_filter?(field, column)
    filter_present?(field) &&
    params[:q][field.to_sym] == column[:filter]
  end

  def filter_present?(field)
    params[:q] &&
    params[:q][field.to_sym].present?
  end

end
