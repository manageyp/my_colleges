# -*- encoding : utf-8 -*-

class Boohee::City < Boohee::BooheeModel
  has_many  :province, :class_name => 'Boohee::Province'
end
