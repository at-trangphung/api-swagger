class User::SessionsController < BaseController
  layout 'customer' 

  before_action :redirect_if_logged_in, only: %i[new create]

  def new
    @user = User.new
  end

  def create
    @user = User.find_by_email(params[:email])
    return sign_in if @user && @user.authenticate(params[:password]) && @user.activated?
    login_failed
  end

  def destroy
    @service_user.log_out
    flash[:success] = "Log out!"
    redirect_to request.referrer
  end

  private
    def sign_in
      if @service_user.login!(@user)
        if params[:remember].to_i == 1
          cookies.permanent[:remember] = params[:remember].to_i
          cookies.permanent.encrypted[:user_id] = @user.id
        end
        flash[:success] = "Logged in!"
        redirect_to request.referrer
      else  
        redirect_to login_path, danger: "Login failed"
      end
    end

    def login_failed
      if !@user.nil? && !@user.activated?
        message  = "Account not activated. "
        message += "Check your email for the activation link."
        flash[:danger] = message
      else
        flash[:danger] = "Invalid email/password combination"
      end
      render :new
    end

    def redirect_if_logged_in
      redirect_to root_path, success: "Already login!" if logged_in?
    end   
end
