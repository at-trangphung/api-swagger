class User::UsersController < BaseController
  layout 'customer'
  before_action :get_user, only: %i[edit update destroy show]

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    sign_up 
  end

  def update
    @user = User.find(params[:id])
    if params[:user][:password]
      if params[:user][:password].blank?
        flash[:danger] = 'Update password failed!'
        render 'show' 
      elsif @user.update_attributes(change_password_params)
        flash[:success] = 'Update password successed!'
        redirect_to @user
      else
        flash[:danger] = 'Update password failed!'
        render 'show' 
      end
    else
      if @user.update(permit_params)
        upload_images
        flash[:success] = 'Update profile successed!'
        redirect_to @user
      else
        render 'edit'
      end
    end 
  end
   
  def destroy
    @service_user.log_out
    @user.destroy
    redirect_to root_path  
  end

  private
    def user_params
      params.permit(:email, :password, :password_confirmation, :first_name, :last_name,
                    :address, :phone, :avatar, :company, :address_deliver)
    end

    def permit_params
      params.require(:user).permit(:first_name, :last_name, :email, :address,
                                   :phone, :avatar, :company, :address_deliver)
    end

    def customer_params
      params.permit(:first_name, :last_name, :email, :address,
                                   :phone, :company, :address_deliver)
    end

    def change_password_params
      params.require(:user).permit(:password, :password_confirmation)
    end

    def sign_up
      @user = User.new(user_params)
      @customer = Customer.new(customer_params)
      if @user.save!
        @user.send_activation_email
        @customer.save!
        message  = "Created account. "
        message += "Please check your email to activate your account."
        flash[:success] = message
        redirect_to login_url
      else
        flash[:danger] = "Create account failed!"
        render 'new'
      end
    end

    def get_user
      @user = User.find(params[:id])
    end
    
    def upload_images
      @uploads = {}

      @uploads[:avatar] = Cloudinary::Uploader.upload(
        permit_params[:avatar], 
        public_id: permit_params[:avatar].original_filename.split('.')[0])
    end
end
