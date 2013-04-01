# -*- encoding : utf-8 -*-

# == Schema Information
#
# Table name: schools
#
#  id          :integer          not null, primary key
#  detail_type :string(255)      not null
#  detail_id   :integer          not null
#  country_id  :integer
#  province_id :integer
#  city_id     :integer
#  nick_name   :string(255)
#  real_name   :string(255)
#  web_site    :string(255)
#  found_year  :string(255)
#  ifeng_code  :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class School < ActiveRecord::Base

  belongs_to :detail, :polymorphic =>true
  belongs_to :country
  belongs_to :province
  belongs_to :city

  has_one :school_introduction

  attr_accessible :country_id, :province_id, :city_id,
                  :nick_name, :real_name, :web_site,
                  :found_year, :ifeng_code

  validates_presence_of :nick_name, :detail_type, :detail_id

  def build_content(content)
    SchoolIntroduction.build_intro(self.id, content)
  end

  def is_domestic?
    detail_type.present? && detail_type == 'Domestic'
  end

  def school_type_name
    self.is_domestic? ? "国内" : "国外"
  end

  ['country', 'province', 'city'].each do |field|
    define_method("#{field}_name") do
      field_value = self.send("#{field}_id")
      if field_value.present?
        self.send("#{field}").real_name
      else
        "无"
      end
    end
  end

  def full_content
    if self.school_introduction
      self.school_introduction.full_content
    else
      "信息暂无"
    end
  end

  class << self
    
    def build_domestic(params)
      province = Province.province_by_name(params[:province_name])
      unless province
        Rails.logger.info "province not found name (#{params[:province_name]})"
        return
      end

      domestic = Domestic.build!(params)
      if domestic
        school = self.new(:country_id => province.country_id,
                          :province_id => province.id,
                          :nick_name => params[:nick_name],
                          :real_name => params[:nick_name],
                          :web_site => params[:web_site],
                          :ifeng_code => params[:ifeng_code])
        school.detail = domestic

        if school.valid? && school.save!
          #SchoolIntroduction.build_intro(school.id, params[:content])
          school
        end
      end
    end

  end

end
