class ProductServices
  attr_reader :params, :flash

  def initialize(params, flash)
    @params = params
    @flash  = flash
  end

  def init
    @product = Product.new
    @product_option = ProductOption.new
    @categories = Category.all.where(parent_id: 0)
    @sizes = Size.all
    @types = Type.all
  end

  def edit
    product_option
  end

  def create
    string = product_params[:image_link].original_filename.split('.')[0]
    @product = Product.new (product_params)
    if @product.save
      @product_option =  @product.product_options.new(option_params)
      @product_option.save
      upload_images
      @product.update!(image_link: string)
      flash[:success] = "add successfully"
    end
  end

  def update
    @product = Product.includes(:category).find(params[:id])
    string = product_params[:image_link].original_filename.split('.')[0]
    if product.update(product_params) && product_option.update(option_params)
      upload_images
      @product.update!(image_link: string)
      flash[:success] = "update successfully"
    end  
  end

  def destroy
    find_product.update(status: "not_exist")
    find_product.map{|p| p.product_options
                               .map{|po| po.update(status: "not_exist")}}
    flash[:success] = "deleted successfully"
  end

  def find_product
    Product.includes(:category).find(params[:id])
  end

  def product_option
    ProductOption.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :category_id, :image_link, :discount)
  end

  def option_params
    params.require(:product).permit(:size_id, :type_id, :price)
  end

  def upload_images
    @uploads = {}

    @uploads[:image_product] = 
      Cloudinary::Uploader.upload( product_params[:image_link], 
                                  :public_id => product_params[:image_link]
                                  .original_filename.split('.')[0])
  end

  def load_list_product
    @products =
      if params[:search]
        Product.search(params[:search]).paginate page: params[:page], per_page: 5
      else
        Product.where(status: "exist").paginate page: params[:page], per_page: 5
      end 
  end
end
