class UserMailer < ApplicationMailer
  default from: "CaferiaCoffe@gmail.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.account_activation.subject
  #
  def account_activation(user)
    @user = user
    mail to: user.email, subject: "Account activation"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  def password_reset(user)
    @user = user
    mail to: user.email, subject: "Password reset"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.check_order.subject
  #
  def check_order(transaction)
    @transaction = transaction
    @order_items = Order.where(transaction_id: @transaction.id)
    @transaction = Transaction.find_by(id: @transaction.id)
    @customer    = Customer.find_by(id: @transaction.customer_id)
    @total_price = @transaction.amount
    mail to: @customer.email, subject: "Order"
  end

  def new_user_checkout(user)
   @user = user
   mail to: user.email, subject: "Activation and UpdatePassword"
  end
end
