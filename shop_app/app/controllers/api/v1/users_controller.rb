module Api::V1
  
  class UsersController < ApiController
    before_action :authorization, only: [:show, :update, :logout, :history_user, :remember_me]
    
    def index
        render json: User.all
    end

    def create
      @user = User.new(user_params)
      if @user.save
        render json: @user, status: :created, location: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end

    def show
      @user = @current_user
      if @user.present?
        render json: @user
      else
        render json: { error: 'Not found' }
      end
    end

    def update
      @current_user = User.find_by(id: payload[0]['user_id'])
      if @current_user.update(profile_user_params)
        render json: @current_user
      else
        render json: @current_user.errors, status: :unprocessable_entity
      end
    end

    def login
      @user = User.find_by_email(params[:email])
      if @user && @user.authenticate(params[:password])

        if @user.activated_at?
          auth_token = JsonWebToken.encode({user_id: @user.id})
          render json: { auth_token: auth_token }, status: :ok
        else
          render json: {error: 'Email not verified' }, status: :unauthorized
        end

      else
        render json: {error: 'Invalid username / password'}, status: :unauthorized
      end
    end

    def forgot_password
      @user = User.find_by(email: params[:email])
      if( @user.update_attribute(:password, params[:password]) && 
        @user.update_attribute(:password_confirmation, params[:password_confirmation]) )
        render json: {status: 'Change password successfully'}, status: :ok
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end

    def logout
      if @current_user.update_attribute(:remember_digest, nil)
        render json: @current_user
      else
        render json: {error: 'Invalid username'}, status: :unauthorized
      end
    end

    def history
      @current_user = User.find_by(id: payload[0]['user_id'])
      if @current_user.present?
      id = Customer.find_by(user_id: @current_user.id)
      @orders = Transaction.where(customer_id: id)
        render json: @orders
      else
       render json: { message: "Unauthorized!" }
      end
    end

    def change_password
      @current_user = User.find_by(id: payload[0]['user_id'])
          binding.pry
      if params[:password]
        if @current_user.update(change_password_params)
          render json: {status: 'Change password successfully'}, status: :ok
        else
          render json: {error: 'change password failed'}
        end
      end 
    end

    def remember_me
      @current_user = User.find_by(id: payload[0]['user_id'])
      if @current_user.present?
        auth_token = JsonWebToken.encode({user_id: @current_user.id})
        @current_user.update_attribute(:remember_digest, auth_token)
        render json: @current_user
      else
        render json: { message: "Unauthorized!" }
      end
    end
    private
      def user_params
        params.permit(:first_name, :last_name, :email, :password)
      end

      def profile_user_params
        params.permit(:first_name, :last_name, :phone, :address,
                      :company, :address_deliver )
      end

      def change_password_params
        params.permit(:password, :password_confirmation )
      end
  end
end
