class User::AccountActivationsController < BaseController
  def edit
    user = User.find_by(email: params[:email])
    # user = User.find_by(email: current_user.email)
    if user && !user.activated?
      session[:user_id] = user.id
      user.activate
      flash[:success] = "Account activated!"
      redirect_to user
    else
      if user.activated?
        flash[:danger] = "Account already activated!"
      else
        flash[:danger] = "Invalid activation link"
      end
      redirect_to root_path
    end
  end

end
