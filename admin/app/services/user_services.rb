class UserServices
  attr_reader :session, :cookies, :params, :flash

  def initialize(session, cookies, params, flash)
    @session = session
    @cookies  = cookies
    @params  = params
    @flash   = flash
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

  def create
   @user = User.new user_params
    if @user.save
      flash[:success] = "add successfully"
    end  
  end

  def update
    @user = User.find_by(id: params[:id])
    role = params[:role_id].to_i
    if (check_role role) && (@user.update_attribute :role_id, role)
      flash[:success] =  "update_success"
    end 
  end

  def check_role role
    array = [1,2]
    true if array.include? role
  end
  
  def destroy
    user =find_user
    if user.destroy!
      flash[:success] = "deleted successfully"
    end  
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

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :address, :phone, :avatar)
  end


  def load_list_user
    if params[:search]
      User.search(params[:search]).paginate(page: params[:page], per_page: 5)
    else
      User.all.paginate(page: params[:page], per_page: 5)
    end 
  end
end
