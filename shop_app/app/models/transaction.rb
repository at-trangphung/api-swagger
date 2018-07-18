class Transaction < ApplicationRecord
  has_many :orders
  has_many :products, through: :orders
  enum status: {waiting: 0, accept: 1, reject: 2}
  
  belongs_to :customer
  
  def send_check_order_email
    UserMailer.check_order(self).deliver_now
  end

  def send_new_user_checkout
    UserMailer.new_user_checkout(self).deliver_now
  end
end
