# -*- encoding : utf-8 -*-

class SchoolFollowObserver < ActiveRecord::Observer

  def after_create(school_follow)
    recalculate_follow_count(school_follow, 1)
  end

  def after_destroy(school_follow)
    recalculate_follow_count(school_follow, -1)
  end

  private

  def recalculate_follow_count(school_follow, point)
    evaluation = SchoolEvaluation.find_or_create(school_follow.school_id)
    evaluation.calculate_follow_count(point)
  end

end
