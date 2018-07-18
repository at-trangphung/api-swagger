# module Services
  class UserServices
    attr_reader :session, :cookies, :params

    def initialize(session, cookies, params)
      @session = session
      @cookies = cookies
      @params = params
    end

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
      unless @current_user
        user = User.find_by(id: cookies.encrypted[:user_id])
        # if user && user.activated? && user.authenticated?(:activation, user.id)
        if user && user.activated?
          login!(user)
          @current_user = user
        end
      end
      @current_user
    end

    def authorize
      if cookies[:remember] != 1
        # redirect_to sessions_sign_in_path unless (current_user && unexperied?)
        redirect_to login_path unless (current_user)   
      end
    end

    def unexperied?
      session[:experied].to_time >= Time.zone.now
    end

    def login!(user)
      session[:user_id] = user.id
    end

    def log_out
      session[:user_id] = nil
      cookies.delete :user_id
      cookies.delete :remember_digest
      @current_user = nil
    end

    def get_service_user
      @service_user ||= ServiceUser.new(session, cookies, params)
    end

  end
# end
