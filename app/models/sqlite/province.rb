# -*- encoding : utf-8 -*-

# == Schema Information
#
# Table name: provinces
#
#  id         :integer          not null, primary key
#  country_id :integer          not null
#  nick_name  :string(255)
#  real_name  :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Sqlite::Province < Sqlite::Base
  attr_accessible :country_id, :nick_name, :real_name

end
