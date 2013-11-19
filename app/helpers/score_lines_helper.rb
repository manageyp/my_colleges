# -*- encoding : utf-8 -*-

module ScoreLinesHelper

  def syear_filters
    select_choices = [['2005','2005'],['2006','2006'],['2007','2007'],['2008','2008'],
                      ['2009','2009'],['2010','2010'],['2011','2011'],['2012','2012'],
                      ['2013','2013']]
    select_tag "syear", options_for_select(select_choices, params[:syear]),{prompt: "选择年份"}
  end

  def smajor_filters
    select_choices = [['理科','1'],['文科','2'],['综合','3']]
    select_tag "smajor", options_for_select(select_choices, params[:smajor]),{prompt: "专业分类"}
  end

end