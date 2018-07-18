class ProductOption < ApplicationRecord
  belongs_to :products, class_name: 'Product', foreign_key: "product_id"
  belongs_to :sizes, class_name: 'Size', foreign_key: "size_id"
  belongs_to :types, class_name: 'Type', foreign_key: "type_id"
  enum status: {not_exist: 0, exist: 1}
end
