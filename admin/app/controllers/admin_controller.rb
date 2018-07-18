class AdminController < ActionController::Base
  layout "admin"
  attr_reader :service_user

  before_action :get_service, :authorize, :logged_in?

  def get_service
    @service_user     = UserServices.new(session, cookies, params, flash)
  end

  def logged_in?
    @service_user.current_user.present?
  end

  def authorize
    if cookies[:remember] != 1
      # redirect_to sessions_sign_in_path unless (current_user && unexperied?)
      redirect_to login_path unless (@service_user.current_user)   
    end
  end
end
