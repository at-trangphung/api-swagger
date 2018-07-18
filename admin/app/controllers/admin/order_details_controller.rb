class Admin::OrderDetailsController < AdminController
  before_action :load_service
  def index
    @order         = @service_order.find_order
    @order_details = @order.orders.paginate(page: params[:page], per_page: 5)
  end

  private
    def load_service
      @service_order    = OrderServices.new(params, flash)
    end
end
