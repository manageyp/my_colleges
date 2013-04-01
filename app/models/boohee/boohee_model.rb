# -*- encoding : utf-8 -*-

module Boohee
  class BooheeModel < ActiveRecord::Base
  self.abstract_class = true  # this prevents ActiveRecord from trying
  def uses_db?
    true
  end
  
  establish_connection "bh_#{Rails.env}".to_sym

  class << self
    
    def boohee_database
      if Rails.env.production?
        "bhdb_pd"
      elsif Rails.env.development?
        "bhdb_dev"
      elsif Rails.env.qa?
        "bhdb_qa"
      else
        "bhdb_test"
      end
    end

  end
  end
end