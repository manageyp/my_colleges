# -*- encoding : utf-8 -*-

# == Schema Information
#
# Table name: devices
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  mac           :string(255)
#  status        :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Device < ActiveRecord::Base
  belongs_to :user
  has_many :school_follows

  attr_accessible :mac, :status, :user_id

  class << self

    def build_device(user)
      create(user_id: user.id, mac: user.user_name)
    end

  end

end
