class Order < ApplicationRecord
  belongs_to :product, foreign_key: "product_id", class_name: "Product" 
  belongs_to :cart, foreign_key: "transaction_id", class_name: "Transaction"   
end
