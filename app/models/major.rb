# -*- encoding : utf-8 -*-

# == Schema Information
#
# Table name: majors
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  parent_id  :integer
#  code       :string(255)
#  college_type  :string(255)
#  eol_url    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Major < ActiveRecord::Base
  has_one :major_introduction
  attr_accessible :code, :college_type, :name, :parent_id, :eol_url

  ModelName = "专业"
  ColumnNames ={
    parent_id: "专业分类ID",
    name: "专业名称",
    code: "专业代号",
    college_type: "本科/专业"
  }

  def parent_name
    if self.parent_id.present?
      major = Major.where(id: parent_id).first
      major.name if major
    end
  end

  class << self

    def paginate_majors(options, page = 1, per_page = 10)
      conditions = []
      conditions << "parent_id != ''"
      conditions << "parent_id = #{options[:parent_id]}" if options[:parent_id].present?
      conditions << "college_type = '#{options[:college_type]}'" if options[:college_type].present?

      if options[:keyword].present?
        conditions << "name like '%#{options[:keyword]}%'"
      end

      paginate(conditions: conditions.join(" AND "),
               page: page,
               per_page: 10,
               order: "id").all
    end

  end

end