# -*- encoding : utf-8 -*-

class Boohee::Province < Boohee::BooheeModel
  has_many  :cities, :class_name => 'Boohee::City'
end
