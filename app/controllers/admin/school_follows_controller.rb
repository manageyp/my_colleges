# -*- encoding : utf-8 -*-

module Admin
  class SchoolFollowsController < BaseController
    before_filter :paginate_page, only: [:index]
    before_filter :load_school, only: [:create]

    def index
      options= {}
      @school_follows = SchoolFollow.paginate_school_follows(options, @page)
    end

    def create
      if params[:follow_type] == "follow"
        SchoolFollow.build(@school, @device)
      else
        school_follow = SchoolFollow.get_follow(@school, @device)
        if school_follow
          school_follow.unfollow!
        else
          render :text => "亲~操作失败，请先关注该学校。", :status => 403 and return
        end
      end

      render :partial => "/common/school_follow_button",
             :locals => { :school => @school, :device => @device }
    end

    private

    def load_school
      @school = School.find_by_id(params[:school_id])
      unless @school
        render :text => "亲~学校不存在，操作失败。", :status => 403
      end
    end

  end
end