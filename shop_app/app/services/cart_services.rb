# module Services
  class CartServices
    attr_reader :params, :session

    def initialize(params, session)
      @params  = params
      @session = session
      # @current_user = current_user
    end

    def create
      session[:shopping_cart] ||= []
      order_detail       = Order.new(item_params)
      order_detail.price = params.require(:cart)[:price]
      order_detail.size  = params.require(:cart)[:size]
      order_detail.type  = params.require(:cart)[:type]

      result = find_product_in_cart(order_detail.product_id , order_detail.size)
      if result
        update_quantity result, order_detail.quantity
      else
        session[:shopping_cart] << order_detail
      end
    end

    def update
      product = Product.find_by id: params[:id]
      size    = product.sizes.find_by(name: params.require(:cart)[:size]).name
      cart_item_quantity = find_product_in_cart(product.id, size)["quantity"]
      if params[:button] == "-"
        quantity = cart_item_quantity - 1
        if quantity <= 0
        # flash[:danger] = "At least 1 product"
        else
          result = find_product_in_cart(product.id, size)
          result["quantity"] = result["quantity"] - 1
        end
      else 
        quantity = cart_item_quantity + 1
        result   = find_product_in_cart(product.id, size)
        result["quantity"] = result["quantity"] + 1
      end
    end

    def destroy_item
      session[:shopping_cart].each do |item|
        session[:shopping_cart].delete(item) if item["product_id"] == params[:id].to_i && 
                                              item["size"] == params[:size]
      end
    end

    def item_params
      params.require(:cart).permit(:product_id, :quantity)
    end
    
    def find_product_in_cart(product_id, size)
      return unless session[:shopping_cart]
      session[:shopping_cart].detect do |item|
        if (item["product_id"] == product_id)
          item["size"] == size
        end 
      end
    end

    def update_quantity result, quantity
      result["quantity"] += quantity
    end
  end
# end
