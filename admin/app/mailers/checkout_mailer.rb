class CheckoutMailer < ApplicationMailer
  def check_order(transaction)
    @transaction = transaction
    @order_items = Order.where(transaction_id: @transaction.id)
    @transaction = Transaction.find_by(id: @transaction.id)
    @customer    = Customer.find_by(id: @transaction.customer_id)
    @total_price = @transaction.amount
    mail to: @customer.email, subject: "Order"
  end
end
