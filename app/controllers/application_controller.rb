class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def has_size?(value)
    value.present? && value.size > 0
  end

  helper_method :has_size?
end
