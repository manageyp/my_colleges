class SchoolsController < ApplicationController
  def index
    page = [params[:page].to_i, 1].max
    @schools = School.paginate(order: "province_id", page: page, per_page: 10)
  end

  def show
    @school = School.find_by_id(params[:id])
  end
end
