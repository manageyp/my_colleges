# -*- encoding : utf-8 -*-

class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authorize

  private

  def authorize
    if session[:device_id]
      load_device_user
    else
      init_device_user
    end
  end

  def load_device_user
    @device = Device.find_by_id(session[:device_id])
    @user = @device.user if @device
  end

  def init_device_user
    @device = User.build_device_user
    if @device
      @user = @device.user
      session[:device_id] = @device.id
    end
  end

  def has_size?(value)
    value.present? && value.size > 0
  end

  def paginate_page
    @page = [params[:page].to_i, 1].max
  end

  helper_method :has_size?

end
