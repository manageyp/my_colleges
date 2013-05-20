# -*- encoding : utf-8 -*-

# == Schema Information
#
# Table name: domestics
#
#  id               :integer          not null, primary key
#  college_type     :string(255)
#  is_211           :string(255)
#  is_985           :string(255)
#  affiliate        :string(255)
#  is_edu_affiliate :string(255)
#  has_bachelor     :string(255)
#  is_independent   :string(255)
#  is_civilian_run  :string(255)
#  key_disciplines  :integer
#  master_num       :integer
#  phd_num          :integer
#  academician_num  :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Domestic < ActiveRecord::Base
  
  attr_accessible :college_type, :is_211, :is_985, :affiliate,
                  :is_edu_affiliate, :has_bachelor, :is_independent,
                  :is_civilian_run, :key_disciplines, :master_num,
                  :phd_num, :academician_num

  #validates_presence_of :college_type

  ModelName = "国内学校"
  ColumnNames = {
    college_type: "院校类别",
    is_211: "是否 211",
    is_985: "是否 985",
    affiliate: "院校隶属于",
    is_edu_affiliate: "是否教育部直属院校",
    has_bachelor: "设立研究生院",
    is_independent: "独立学院",
    is_civilian_run: "民办院校",
    key_disciplines: "国家重点学科",
    master_num: "硕士点",
    phd_num: "博士点",
    academician_num: "院士人数"
  }

  class << self
    
    def build!(params)
      domes = self.new(college_type: params[:college_type],
                       is_211: params[:is_211],
                       is_985: params[:is_985],
                       affiliate: params[:affiliate],
                       is_edu_affiliate: params[:is_edu_affiliate],
                       has_bachelor: params[:has_bachelor],
                       is_independent: params[:is_independent],
                       is_civilian_run: params[:is_civilian_run],
                       key_disciplines: params[:key_disciplines],
                       master_num: params[:master_num],
                       phd_num: params[:phd_num],
                       academician_num: params[:academician_num])
      if domes.valid?
        domes.save! and domes
      end
    end

  end
end
