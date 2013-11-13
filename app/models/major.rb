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
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Major < ActiveRecord::Base
  attr_accessible :code, :college_type, :name, :parent_id
end