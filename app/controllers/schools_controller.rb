# -*- encoding : utf-8 -*-

class SchoolsController < ApplicationController
  before_filter :paginate_page, only: [:index]

  def index
    options = { province: params[:province],
                professional_type: params[:professional_type],
                keyword: params[:keyword]
              }
    @schools = School.paginate_schools(options, @page)
  end

  def show
    @school = School.find_by_id(params[:id])
  end

end
