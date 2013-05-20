# -*- encoding : utf-8 -*-

# == Schema Information
#
# Table name: provinces
#
#  id         :integer          not null, primary key
#  country_id :integer          not null
#  nick_name  :string(255)
#  real_name  :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Province < ActiveRecord::Base
  
  attr_accessible :country_id, :nick_name, :real_name

  validates_presence_of :country_id

  class << self

    def get_by_name(title)
      title = "内蒙古" if title == '内蒙'
      self.where("nick_name = ?", title).first
    end
    
    def create_province(country_id, nick_name, real_name = nil)
      real_name ||= nick_name
      p = self.new(country_id: country_id,
                   nick_name: nick_name,
                   real_name: real_name)
      if p.valid?
        p.save! and p
      end
    end

  end

end
