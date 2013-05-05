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

class SchoolPhoto < ActiveRecord::Base
  belongs_to :school

  attr_accessible :is_avatar, :photo_url, :school_id, :status

  class << self

    def set_school_photo(school, photo_url)
      photo = where(school_id: school.id).first
      if photo
        photo.update_attributes(photo_url: photo_url)
      else
        create(school_id: school.id,
               photo_url: photo_url,
               is_avatar: true,
               status: 'initial')
      end
    end

  end

end
