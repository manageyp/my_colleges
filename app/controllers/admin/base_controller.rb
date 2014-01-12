module Admin
  class BaseController < ActionController::Base
    layout 'admin'
    protect_from_forgery
    before_filter :authentication
    before_filter :set_device_user

    def authentication
      return true if Rails.env.test?

      authenticate_or_request_with_http_basic do |name, password|
        name == 'admin' && password == 'password'
      end
    end

    def set_device_user
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
end