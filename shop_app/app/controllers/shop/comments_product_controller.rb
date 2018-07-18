class Shop::CommentsProductController <  BaseController
  before_action :load_service

  def new
    @comment = Comment.new
  end

  def create
    @service_comment_product.create
    product = @service_comment_product.find_product
    redirect_to product_path(product)
  end

  def destroy
    @service_comment_product.destroy
    product = @service_comment_product.find_product
    redirect_to product_path(product)
  end

  private
    def load_service
      @service_comment_product = CommentProductServices.new(params, flash, @service_user.current_user)
    end
end
