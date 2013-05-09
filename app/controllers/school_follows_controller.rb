class SchoolFollowsController < ApplicationController
  before_filter :paginate_page, only: [:index]

  def index
    options= {}
    @school_follows = SchoolFollow.paginate_school_follows(options, @page)
  end

  def create

  end

end
