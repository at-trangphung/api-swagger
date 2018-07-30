module Api::V1
  class ProductsController < ApiController

    def index
      render json: Product.where(status: "exist")
    end

    def show
      @product = Product.find_by(id: params[:id], status: "exist")
      if @product.present?
        render json: @product
      else
        render json: { message: "Not found!" }
      end      
    end

    def list_products_by_category
      @list_products = Product.where(category_id: params[:id])
      if @list_products.present?
        render json: @list_products
      else
        render json: { message: "Not found!" }
      end 
    end
  end
end