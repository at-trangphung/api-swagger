class Shop::ProductsController < BaseController
  layout 'customer'
  before_action :load_service

  def index
    @products = Product.all
  end

  def update
  end

  def show
    @product = load_product
    @category = Category.find_by(id: @product.category_id)
    @price = @product.product_options
    @sizes = @product.sizes.distinct
    @types = @product.types.distinct
    @comment = Comment.new
    @comments = @product.comment_products.where(
          parent_id: 0).paginate page: params[:page], per_page: 3
    @productSuggest = Product.where(category_id: @product.category_id,status: "exist")
                             .order(like: :desc).first(3)
  end

  private
    def load_product
      Product.find_by(id: params[:id], status: "exist")
    end

    def load_service
      @service_favorite = FavoritesServices.new(params, @service_user.current_user)
    end
end
