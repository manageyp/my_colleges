# -*- encoding : utf-8 -*-

class MajorsController < ApplicationController
  before_filter :paginate_page, only: [:index]

  def index
    options = { parent_id: params[:parent_id],
                college_type: params[:college_type],
                keyword: params[:keyword] }
    @majors = Major.paginate_majors(options, @page)
  end

  def show
    @major = Major.find_by_id(params[:id])
  end

end