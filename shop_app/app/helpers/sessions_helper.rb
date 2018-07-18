# frozen_string_literal: true

module SessionsHelper
  # def current_user
  #     # binding.pry
  #   @current_user ||= User.find(session[:user_id]) if session[:user_id]
  #   unless @current_user
  #     user = User.find_by(id: cookies.encrypted[:user_id])
  #     if user && !user.activated? && user.authenticated?(:activation, params[:id])
  #       session[:user_id] = user.id
  #       @current_user = user
  #     end
  #     # redirect_to root_path
  #   end
  #   @current_user
  # end

  def authorize
    if cookies[:remember] != 1
      # redirect_to sessions_sign_in_path unless (current_user && unexperied?)
      redirect_to sessions_sign_in_path unless (current_user)   
    end
  end

  def unexperied?
    session[:experied].to_time >= Time.zone.now
  end
end
