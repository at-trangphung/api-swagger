class FavoritesServices
  attr_reader :params, :current_user

  def initialize(params, current_user)
    @params = params
    @current_user = current_user
  end 
  
  def create_favorite
    Favorite.create!(param_favorite)
    @product = find_product
    like = @product.like
    @product.update!(like: like+1)
  end

  def destroy_favorite
    Favorite.find_by(user_id: params[:user_id], product_id: params[:product_id]).delete
    @product = find_product
    like = @product.like
    @product.update!(like: like-1)
  end

  def check_like(user_id, product_id)
    Favorite.find_by(user_id: user_id, product_id: product_id)
  end

  def param_favorite
    params.permit(:product_id, :user_id)
  end

  def find_product
    Product.find_by(id: params[:product_id])
  end
end