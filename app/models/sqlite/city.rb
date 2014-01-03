# -*- encoding : utf-8 -*-

# == Schema Information
#
# Table name: cities
#
#  id          :integer          not null, primary key
#  province_id :integer          not null
#  nick_name   :string(255)
#  real_name   :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Sqlite::City < Sqlite::Base
  attr_accessible :province_id, :nick_name, :real_name

end
