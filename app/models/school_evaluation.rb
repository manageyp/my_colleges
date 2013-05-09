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
end
