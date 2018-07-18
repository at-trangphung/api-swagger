class Admin::OrdersController < AdminController
  before_action :load_service

  def index
    @orders = @service_order.load_list_order
  end

  def update
    @service_order.update_order
    redirect_to orders_path
  end

  private
  def load_service
    @service_order = OrderServices.new(params, flash)
  end
end
