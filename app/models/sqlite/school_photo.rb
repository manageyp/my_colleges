# -*- encoding : utf-8 -*-

# == Schema Information
#
# Table name: school_photos
#
#  id            :integer          not null, primary key
#  school_id     :integer          not null
#  photo_url     :string(255)
#  is_avatar     :boolean
#  status        :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Sqlite::SchoolPhoto < Sqlite::Base
  attr_accessible :is_avatar, :photo_url, :school_id, :status

end
