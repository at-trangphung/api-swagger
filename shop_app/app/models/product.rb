class Product < ApplicationRecord
  has_many :product_options
  has_many :sizes, through: :product_options
  has_many :types, through: :product_options
  has_many :comment_products, dependent: :destroy
  has_many :favorites, dependent: :destroy

  belongs_to :category
  has_many :orders
  has_many :transactions, through: :orders
  enum status: {not_exist: 0, exist: 1}
end
