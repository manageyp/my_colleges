# -*- encoding : utf-8 -*-

# == Schema Information
#
# Table name: major_introductions
#
#  id            :integer          not null, primary key
#  major_id     :integer          not null
#  content :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class MajorIntroduction < ActiveRecord::Base
  attr_accessible :content, :major_id
end
