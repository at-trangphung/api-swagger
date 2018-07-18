class Product < ApplicationRecord
  belongs_to :category
  has_many :orders
  has_many :transactions, through: :orders
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  has_many :product_options
  has_many :sizes, through: :product_options
  has_many :types, through: :product_options

  scope :search, ->(key){where("status = ? AND name LIKE ?", 1, "%#{key}%")}
  enum status: {not_exist: 0, exist: 1}
end
