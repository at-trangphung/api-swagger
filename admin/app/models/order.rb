class Order < ApplicationRecord
  belongs_to :product, foreign_key: "product_id", class_name: "Product" 
  belongs_to :carts, foreign_key: "transaction_id", class_name: "Transaction"   
  enum status: {waiting: 0, accept: 1, reject: 2}
end
