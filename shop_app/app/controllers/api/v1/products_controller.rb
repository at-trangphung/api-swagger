module Api::V1
  class ProductsController < ApiController

    def index
      render json: load_list_product
    end

    def show
      @product = Product.find_by(id: params[:id], status: "exist")
      if @product.present?
        render json: @product
      else
        render json: { message: "Not found!" }
      end      
    end

    private
    def list_products_by_category
      @list_products = Product.where(category_id: params[:id_category])
      if @list_products.present?
        render json: @list_products
      else
        render json: { message: "Not found!" }
      end 
    end

    def load_list_product
        @products =
          if params[:search]
            Product.search(params[:search]).paginate page: params[:page], per_page: 9
          else
            Product.where(status: "exist").paginate page: params[:page], per_page: 9
          end 
        return @products
      end
  end
end