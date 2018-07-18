class ShopController < BaseController
  before_action :logged_in?
  before_action :load_service
  
  def index
    @categories = list_find_category
    @productList = Product.where(status: "exist").paginate page: params[:page],
            per_page: 9
    @order_details = []
    @count_products = 0
    @total = 0
    @len = Product.all.size
    @productSuggest = Product.where(status: "exist")
                            .order(like: :desc).first(3)
  end

  def create
  end

  def search
    @categories = list_find_category
    @listProduct = @service_shop.search_product
  end

  def show
    @categories = list_find_category
    @productByCategory = Product.where(category_id: params[:id],status: "exist")
                        .paginate page: params[:page], per_page: 9
    @lengh = Product.where(category_id: params[:id]).size
  end 

  private
    def list_find_category
      Category.where(parent_id: 0, status: "exist")
    end 

    def load_service
      @service_shop     = ShopServices.new(params)
      @service_favorite = FavoritesServices.new(params, @service_user.current_user)
    end
end
