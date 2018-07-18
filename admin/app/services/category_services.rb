class CategoryServices
  attr_reader :params, :flash

  def initialize(params, flash)
    @params = params
    @flash  = flash
  end

  def create_category
    parent_id = category_params[:parent_id]
    parent_id = 0 if category_params[:parent_id].empty?
    @category = Category.new(name: category_params[:name], parent_id: parent_id)
    if @category.save
      flash[:success] = "add successfully"
    end
  end

  def update_category
    category = Category.find_by(name: category_params[:name])
    if category_params[:parent_id].empty?
      parent_id = 0
    else
      parent_id = category_params[:parent_id]
    end
    if category.update(name: category_params[:name], parent_id: parent_id)
      flash[:success] = "update successfully"
    end  
  end

  def destroy_category
    category = find_category
    @categories = []
    @categories << category
    @categories << Category.find_by(parent_id: params[:id])
    @categories.each do |category|
      if category != nil
        category.update!(status: "not_exist")
        category.products.update(status: "not_exist")
        category.products.map{|p| p.product_options
                                   .map{|po| po.update(status: "not_exist")}}
      end  
    end  
    flash[:success] = "deleted successfully"  
  end

  def category_params
    params.require(:category).permit(:name, :parent_id)
  end


  def load_list_category
    @categories =
      if params[:search]
        Category.search(params[:search]).paginate page: params[:page], per_page: 5
      else
        Category.where(status: "exist").paginate page: params[:page], per_page: 5
      end 
  end

  def load_parent_category
     Category.where(parent_id: 0, status: "exist")
  end

  def find_category
    Category.find_by(id: params[:id])
  end
end
