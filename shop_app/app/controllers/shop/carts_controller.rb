class Shop::CartsController < BaseController
  layout 'customer'
  before_action :load_service

  def index
  end

  def create
    @service_cart.create
    flash[:success] = "Add to cart success"
    redirect_to request.referrer
  end

  def update
    @service_cart.update
    flash[:success] = "add success"
    redirect_to carts_path
  end

  def destroy
    @service_cart.destroy_item
    flash[:success] = "Delete success"
    redirect_to carts_path
  end

  private
  
  def load_service
    @service_cart = CartServices.new(params, session)
  end
end
