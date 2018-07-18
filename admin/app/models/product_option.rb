class ProductOption < ApplicationRecord

  belongs_to :product, class_name: 'Product', foreign_key: "product_id"
  belongs_to :size, class_name: 'Size', foreign_key: "size_id"
  belongs_to :type, class_name: 'Type', foreign_key: "type_id"

  validates :price, presence: true, numericality: true
  enum status: {not_exist: 0, exist: 1}
end
