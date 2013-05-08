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
#  address     :string(255)
#  telephone   :string(255)
#  sina_code   :string(255)
#  latitude     :string(255)
#  longitude   :string(255)
#  zipcode   :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class School < ActiveRecord::Base

  include Extras::SchoolTypes

  belongs_to :detail, :polymorphic =>true
  belongs_to :country
  belongs_to :province
  belongs_to :city

  has_one :school_introduction
  has_one :school_avatar, class_name: "SchoolPhoto", conditions: ["is_avatar = ?", true]
  has_many :school_photos

  attr_accessible :country_id, :province_id, :city_id,
                  :nick_name, :real_name, :web_site,
                  :found_year, :ifeng_code, :address,
                  :telephone, :sina_code, :latitude,
                  :longitude, :zipcode

  validates_presence_of :nick_name, :detail_type, :detail_id

  ModelName = "学校"
  ColumnNames ={
    :country_id => "所在国家",
    :province_id => "所在省份",
    :city_id => "所在城市",
    :nick_name => "别名",
    :real_name => "真名",
    :web_site => "网址",
    :found_year => "创建年份",
    :address => "地址",
    :telephone => "联系电话",
    :latitude => "纬度",
    :longitude => "经度",
    :zipcode => "邮政编码"
  }

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

  def refresh_address(params)
    self.update_attributes(params)
  end

  class << self

    def paginate_schools(options, page = 1, per_page = 10)
      conditions = []
      joins = "join domestics on schools.detail_id = domestics.id"

      if options[:province].present?
        conditions << "schools.province_id = #{options[:province]}"
      end

      if options[:professional_type].present?
        professional_type = professional_type_name(options[:professional_type])
        if professional_type
          conditions << "domestics.college_type = '#{professional_type}'"
        end
      end

      paginate(select: "schools.id,schools.province_id,schools.real_name",
               conditions: conditions.join(" AND "),
               joins: joins,
               page: page,
               per_page: 10,
               order: "id").all
    end

    def search_schools(options, page = 1, per_page = 10)
      paginate(conditions: ["real_name like ?", "%#{options[:keyword]}%"],
               page: page,
               per_page: 10,
               order: "id").all
    end

    def build_sina_domestic(params)
      domestic = Domestic.build!(params)
      if domestic
        school = self.new(:country_id => params[:country_id],
                          :province_id => params[:province_id],
                          :nick_name => params[:nick_name],
                          :real_name => params[:nick_name],
                          :web_site => params[:web_site],
                          :address => params[:address],
                          :telephone => params[:telephone],
                          :sina_code => params[:sina_code])
        school.detail = domestic

        if school.valid? && school.save!
          #SchoolIntroduction.build_intro(school.id, params[:content])
          school
        end
      end
    end
    
    def build_ifeng_domestic(params)
      province = Province.get_by_name(params[:province_name])
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
