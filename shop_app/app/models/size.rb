class Size < ApplicationRecord
  has_many :product_options
  has_many :products, through: :product_options
end
