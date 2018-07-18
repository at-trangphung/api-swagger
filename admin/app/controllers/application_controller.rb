class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  attr_reader :service_user

  before_action :get_service
  def get_service
    @service_user = UserServices.new(session, cookies, params, flash)
  end

  def logged_in?
    @service_user.current_user.present?
  end
end
