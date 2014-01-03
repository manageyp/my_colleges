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

class Sqlite::SchoolIntroduction < Sqlite::Base
  attr_accessible :school_id, :short_content, :full_content

end
