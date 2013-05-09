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

  class << self

    def paginate_school_follows(options, page = 1, per_page = 10)
      paginate(page: page, per_page: 10, order: "id desc").all
    end

  end

end
