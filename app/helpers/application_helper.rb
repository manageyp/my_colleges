# -*- encoding : utf-8 -*-

module ApplicationHelper

  def chinese_pagination(collection)
    options = { :previous_label => "上一页",
                :next_label => "下一页" }
    will_paginate(collection, options)
  end

end
