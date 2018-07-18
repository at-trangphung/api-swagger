class Shop::CategoryController < BaseController

  def index
  end

  def new
    @category = Category.new
  end
end
