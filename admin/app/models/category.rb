class Category < ApplicationRecord
  has_many :products
  belongs_to :parent, class_name: "Category", optional: true
  has_many :children, class_name: "Category", foreign_key: "parent_id"
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  scope :search, ->(key){where("status = ? AND name LIKE ?", 1, "%#{key}%")}
  enum status: {not_exist: 0, exist: 1}
end
