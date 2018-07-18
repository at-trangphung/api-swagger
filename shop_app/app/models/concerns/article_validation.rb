class ArticleValidation < ApplicationRecord
  validates :first_name, presence: true, name: true
  validates :last_name, presence: true, name: true
  validates :email, presence: true, email: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, confirmation: true, password_strong: true, on: :create
  validates :password, allow_blank: true, confirmation: true, password_strong: true, on: :update
  validates :phone, allow_blank: true, phone_number: true, on: :update
  validate  :picture_size
end
