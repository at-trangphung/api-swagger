class Transaction < ApplicationRecord
  belongs_to :customer, foreign_key: "customer_id", class_name: "Customer" 
  has_many :orders
  has_many :products, through: :orders
  enum status: {waiting: 0, accept: 1, reject: 2}
  
  def send_check_order_email
    CheckoutMailer.check_order(self).deliver_now
  end
end
