# -*- encoding : utf-8 -*-

class ScoreLinesController < ApplicationController
  before_filter :paginate_page, only: [:index]

  def index
    options = { province_id: params[:province],
                syear: params[:syear],
                smajor: params[:smajor] }
    @score_lines = ScoreLine.paginate_lines(options, @page)
  end

end