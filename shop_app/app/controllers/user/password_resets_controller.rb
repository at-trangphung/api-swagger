class User::PasswordResetsController < BaseController
  layout 'customer'
  before_action :get_user,   only: [:edit, :update]
  before_action :valid_user, only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]  

  def new
    
  end

  def create
    @user = User.find_by(email: params[:password_reset][:email].downcase)
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:success] = "Email sent with password reset instructions"
      redirect_to request.referrer
    else
      flash[:danger] = "Email address not found"
      render 'new'
    end
  end

  def edit

  end

  def update        
    if params[:user][:password].empty?               
      flash[:danger] = "can't be empty"
      render 'edit'
    elsif @user.update_attributes(user_params)
      @user.update_attribute(:reset_digest, nil)

      flash[:success] = "Password has been reset."
      redirect_to login_path
    else
      render 'edit'                                    
    end
  end
  
  private
    def user_params
      params.require(:user).permit(:password, :password_confirmation)
    end
    
    def check_expiration
      if @user.password_reset_expired?
        flash[:danger] = "Password reset has expired."
        redirect_to new_password_reset_url
      end
    end

    def get_user
      @user = User.find_by(email: params[:email])
    end

    # Confirms a valid user.
    def valid_user
      @user = User.find_by(email: params[:email])
      unless (@user && @user.activated?)
        redirect_to root_url
      end
    end
end
