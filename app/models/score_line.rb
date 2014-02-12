# -*- encoding : utf-8 -*-

# == Schema Information
#
# Table name: score_lines
#
#  id           :integer          not null, primary key
#  province_id  :integer
#  syear        :integer
#  smajor       :integer
#  recruit_stage  :integer
#  score          :integer

class ScoreLine < ActiveRecord::Base
  belongs_to :province
  attr_accessible :name, :province_id, :syear, :smajor, :batch, :score

  ModelName = "分数线"
  ColumnNames ={
    name: "分数线名称",
    province_id: "省份",
    syear: "年份",
    smajor: "文科/理科/综合",
    batch: "录取阶段：第一/二/三批",
    score: "分数"
  }

  def smajor_name
    case self.smajor
    when 1
      '理科'
    when 2
      '文科'
    else
      '综合'
    end
  end

  class << self

    def paginate_lines(options, page = 1, per_page = 10)
      conditions = []
      conditions << "province_id = #{options[:province_id]}" if options[:province_id].present?
      conditions << "syear = #{options[:syear]}" if options[:syear].present?
      conditions << "smajor = #{options[:smajor]}" if options[:smajor].present?

      paginate(conditions: conditions.join(" AND "),
               page: page,
               per_page: 10,
               order: "province_id,syear desc").all
    end

  end

end