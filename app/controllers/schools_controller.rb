# -*- encoding : utf-8 -*-

class SchoolsController < ApplicationController
  before_filter :paginate_page, only: [:index, :search]

  def index
    options = { province: params[:province] }
    @schools = School.paginate_schools(options, @page)
  end

  def show
    @school = School.find_by_id(params[:id])
  end

  def search
    @keyword = params[:keyword]
    options = { keyword: @keyword}
    @schools = School.search_schools(options, @page)
    render action: 'index'
  end

end
