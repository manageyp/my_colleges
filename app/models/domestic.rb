# -*- encoding : utf-8 -*-

# == Schema Information
#
# Table name: domestics
#
#  id               :integer          not null, primary key
#  college_type     :string(255)
#  is_211           :string(255)
#  is_985           :string(255)
#  affiliate        :string(255)
#  is_edu_affiliate :string(255)
#  has_bachelor     :string(255)
#  is_independent   :string(255)
#  is_civilian_run  :string(255)
#  key_disciplines  :integer
#  master_num       :integer
#  phd_num          :integer
#  academician_num  :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Domestic < ActiveRecord::Base
  
  attr_accessible :college_type, :is_211, :is_985, :affiliate,
                  :is_edu_affiliate, :has_bachelor, :is_independent,
                  :is_civilian_run, :key_disciplines, :master_num,
                  :phd_num, :academician_num

  validates_presence_of :college_type

  class << self
    
    def build!(params)
      domes = self.new(:college_type => params[:college_type],
                       :is_211 => params[:is_211],
                       :is_985 => params[:is_985],
                       :affiliate => params[:affiliate],
                       :is_edu_affiliate => params[:is_edu_affiliate],
                       :has_bachelor => params[:has_bachelor],
                       :is_independent => params[:is_independent],
                       :is_civilian_run => params[:is_civilian_run],
                       :key_disciplines => params[:key_disciplines],
                       :master_num => params[:master_num],
                       :phd_num => params[:phd_num],
                       :academician_num => params[:academician_num])
      if domes.valid?
        domes.save! and domes
      end
    end

  end
end
