class Shop::CheckoutController < BaseController
  layout 'customer'
  before_action :load_service

  def create
    @service_checkout.checkout
    redirect_to thanks_for_order_path
  end

  def new
    @transaction = Transaction.new
  end

  def show
    @order_items = @service_checkout.load_order
    @transaction = @service_checkout.load_transaction
    @customer    = @service_checkout.load_customer
    @total_price = @transaction.amount
  end

  private
    def load_service
      @service_checkout = CheckoutServices.new(params, @service_user.current_user, load_cart, @total, session)
    end
end
