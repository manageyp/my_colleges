# -*- encoding : utf-8 -*-

# == Schema Information
#
# Table name: school_introductions
#
#  id            :integer          not null, primary key
#  school_id     :integer          not null
#  short_content :string(255)
#  full_content  :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class SchoolIntroduction < ActiveRecord::Base
  belongs_to :school
  
  attr_accessible :school_id, :short_content, :full_content

  validates_presence_of :school_id, :full_content

  class << self
    
    def build_intro(school_id, content)
      si = self.new(school_id: school_id, full_content: content)
      if si.valid?
        si.save!
      end
    end

  end

end
