module Api::V1
  
  class UsersController < ApiController
    before_action :authorization, only: [:show, :update, :destroy]
    
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
        render json: { message: "Not found" }
      end
    end

    def update
      @user = User.find(params[:id])
      if @user.update(profile_user_params)
        render json: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end

    def login
      @user = User.find_by_email(params[:email])
      if @user && @user.authenticate(params[:password])

        if @user.activated_at?
          auth_token = JsonWebToken.encode({user_id: @user.id})
          @user.update_attribute(:remember_digest, auth_token)
          render json: { auth_token: auth_token }, status: :ok
        else
          render json: {error: 'Email not verified' }, status: :unauthorized
        end

      else
        render json: {error: 'Invalid username / password'}, status: :unauthorized
      end
    end

    def destroy
        @current_user.update_attribute(:remember_digest, nil)
    end

    private
      def user_params
        params.permit(:first_name, :last_name, :email, :password)
      end

      def profile_user_params
        params.permit(:first_name, :last_name, :phone, :address,
                      :company, :address_deliver )
      end
  end
end
