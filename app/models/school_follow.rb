# -*- encoding : utf-8 -*-

# == Schema Information
#
# Table name: school_follows
#
#  id            :integer          not null, primary key
#  school_id     :integer
#  device_id     :integer
#  the_date      :date
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class SchoolFollow < ActiveRecord::Base
  belongs_to :school
  belongs_to :device

  attr_accessible :device_id, :school_id, :the_date

  def unfollow!
    self.destroy
  end

  class << self

    def build(school, device)
      unless followed?(school, device)
        create(school_id: school.id,
               device_id: device.id,
               the_date: Date.today)
      end
    end

    def followed?(school, device)
      exists?(school_id: school.id, device_id: device.id)
    end

    def get_follow(school, device)
      where(school_id: school.id, device_id: device.id).first
    end

    def paginate_school_follows(options, page = 1, per_page = 10)
      paginate(page: page, per_page: 10, order: "id desc").all
    end

  end

end
