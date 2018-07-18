class Admin::UsersController < AdminController
  
  def index
    @users = @service_user.load_list_user
  end

  def new
    @users = @service_user.load_list_user
    @user = User.new
  end

  def create
    @service_user.create
    redirect_to users_path
  end

  def edit
    @users = @service_user.load_list_user
    @user   = @service_user.find_user
  end

  def update
    @service_user.update   
    redirect_to users_path
  end

  def destroy
    @service_user.destroy
    redirect_to users_path
  end
end
