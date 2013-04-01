# -*- encoding : utf-8 -*-

# == Schema Information
#
# Table name: countries
#
#  id         :integer          not null, primary key
#  nick_name  :string(255)
#  real_name  :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Country < ActiveRecord::Base
  attr_accessible :nick_name, :real_name
end
