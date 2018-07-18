class Size < ApplicationRecord
  has_many :product_options
  has_many :products, through: :product_options

  validates :name, uniqueness: { case_sensitive: false }
end
