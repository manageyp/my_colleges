# -*- encoding : utf-8 -*-

module Sqlite
  class Base < ActiveRecord::Base
    self.abstract_class = true

    def uses_db?
      true
    end

    establish_connection "sqlite_#{Rails.env}".to_sym

  end
end