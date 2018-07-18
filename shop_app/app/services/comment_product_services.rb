class CommentProductServices
  attr_reader :params, :flash, :current_user

  def initialize(params, flash, current_user)
    @params       = params
    @flash        = flash
    @current_user = current_user
  end

  def create
    product = find_product
    if comment_params[:content].blank?
      flash[:danger] = "add comment failed"
    else
      @comment = product.comment_products.create!(comment_params)
    end
  end

  def destroy
    product   = find_product
    @comments = []
    @comments << product.comment_products.find_by(id: params[:id])
    @comments << product.comment_products.find_by(parent_id: params[:id])
    @comments.each do |comment|
      if comment != nil
        comment.destroy
      end  
    end  
  end

  def find_product
    return @product if @product
    @product = Product.find_by(id: params[:product_id])
  end

  def comment_params
    params.require(:comment_product).permit(:content, :parent_id)
                                    .merge(user_id: @current_user.id)
  end
end
