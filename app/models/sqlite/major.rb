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

class Sqlite::Major < Sqlite::Base
  attr_accessible :code, :college_type, :name, :parent_id, :eol_url

  ModelName = "专业"
  ColumnNames ={
    parent_id: "专业分类ID",
    name: "专业名称",
    code: "专业代号",
    college_type: "本科/专业"
  }

end