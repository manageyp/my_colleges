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
  attr_accessible :device_id, :school_id, :the_date
end
