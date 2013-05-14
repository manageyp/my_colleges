# -*- encoding : utf-8 -*-

# == Schema Information
#
# Table name: users
#
#  id            :integer          not null, primary key
#  user_name     :string(255)
#  email         :string(255)
#  email_status  :string(255)
#  cellphone     :string(255)
#  cellphone_status     :string(255)
#  register_date :date
#  status        :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class User < ActiveRecord::Base
  has_many :devices

  attr_accessible :cellphone, :cellphone_status, :email, :email_status,
                  :register_date, :status, :user_name

  class << self

    def build_device_user
      user = User.new(user_name: generate_user_name('device'))
      if user.save
        Device.build_device(user)
      end
    end

    private

    def generate_user_name(provider)
      user_name_generator = Proc.new { "#{provider}_#{SecureRandom.hex(4)}" }
      loop do
        user_name = user_name_generator.call
        break user_name unless User.where(user_name: user_name).exists?
      end
    end

  end

end
