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
    smajor: "文科/理科/专科",
    batch: "录取阶段：第一/二/三批",
    score: "分数"
  }


end