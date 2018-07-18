class Admin::CategoriesController < AdminController
  before_action :load_service
  def index
    @categories = @service_category.load_list_category
  end

  def new
    @categories = @service_category.load_parent_category
    @category   = Category.new
  end

  def create
    @service_category.create_category
    redirect_to categories_path
    
  end
  def edit
    @categories = @service_category.load_parent_category
    @category   = @service_category.find_category
  end

  def update
    @service_category.update_category
    redirect_to categories_path
  end

  def destroy
    @service_category.destroy_category
    redirect_to categories_path
  end

  private
  def load_service
    @service_category = CategoryServices.new(params, flash)
  end
end
