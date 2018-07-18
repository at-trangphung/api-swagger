class ProductOptionServices
  attr_reader :params, :flash

  def initialize(params, flash)
    @params = params
    @flash  = flash
  end
  
  def create_product_option
    load_data
    @product_option = ProductOption.new product_option_params
    if find_product_on_list(product_option_params[:product_id], 
      product_option_params[:type_id], 
      product_option_params[:size_id],product_option_params[:price]).nil? 
      @product_option.save
      flash[:success] = "add successfully"
    else
      flash[:danger] = "add failed"
    end
  end

  def update_product_option
    if product_option.update(product_option_params)
      flash[:success] = "update successfully"
    else
      flash[:danger] = "update failed"
    end
  end

  def destroy_product_option
    product_option.map{|po| po.update(status: "not_exist")}
    flash[:success] = "deleted successfully"
  end

  def product_option
    ProductOption.find(params[:id])
  end

  def product_option_params
    params.require(:product_option).permit(:product_id, 
                            :type_id, :size_id, :price)
  end

  def find_product_on_list (product_id, type_id, size_id, price)
    return result = ProductOption.find_by(product_id: product_id,
      type_id: type_id,
      size_id: size_id, price: price.to_s)
  end

  def load_list_product_option
    ProductOption.where(status: "exist").paginate(page: params[:page], per_page: 10)
  end

  def load_data  
    @sizes = Size.all
    @types = Type.all
    @products = Product.all
  end

  def find_product_option
    ProductOption.find_by(id: params[:id]) 
  end
end
