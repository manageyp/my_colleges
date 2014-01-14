# -*- encoding : utf-8 -*-

class HomesController < ApplicationController

  def index
    page = 1
    hot_count = 4
    school_options = { province: 1 }
    @schools = School.paginate_schools(school_options, page, hot_count)

    major_options = { college_type: '本科' }
    @majors = Major.paginate_majors(major_options, page, hot_count)
  end
end