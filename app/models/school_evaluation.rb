# -*- encoding : utf-8 -*-

# == Schema Information
#
# Table name: school_evaluations
#
#  id            :integer          not null, primary key
#  school_id     :integer
#  follow_count  :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class SchoolEvaluation < ActiveRecord::Base
  attr_accessible :follow_count, :school_id

  def calculate_follow_count(point)
    self.update_attributes(follow_count: self.follow_count + point)
  end

  class << self

    def find_or_create(school_id)
      evaluation = where(school_id: school_id).first
      evaluation || create(school_id: school_id)
    end

  end

end
