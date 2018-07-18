class User::MyCommentsController < BaseController
  layout 'customer'
  before_action :logged_in?
 
  def index
    @my_comments= CommentProduct.where(user_id: @service_user.current_user)
                                .order(product_id: :desc)
                                .paginate page: params[:page], per_page: 10
    @lenOfMyComments = @my_comments.size                            
  end
end
