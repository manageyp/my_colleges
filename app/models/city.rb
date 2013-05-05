# -*- encoding : utf-8 -*-

# == Schema Information
#
# Table name: cities
#
#  id          :integer          not null, primary key
#  province_id :integer          not null
#  nick_name   :string(255)
#  real_name   :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class City < ActiveRecord::Base
  attr_accessible :province_id, :nick_name, :real_name

  validates_presence_of :province_id

  class << self

    def get_by_name(title)
      self.where("real_name like ?", "#{title}%").first
    end

    def create_city(province_id, nick_name, real_name = nil)
      real_name ||= nick_name
      p = self.new(:province_id => province_id,
                   :nick_name => nick_name,
                   :real_name => real_name)
      if p.valid?
        p.save! and p
      end
    end

  end

end
