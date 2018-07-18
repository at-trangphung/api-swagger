class User < ApplicationRecord
  has_secure_password validations: false
  attr_accessor :activation_token, :reset_token

  # mount_uploader :avatar
  before_save   :downcase_email

  validates :first_name, presence: true, name: true
  validates :last_name, presence: true, name: true
  validates :email, presence: true, email: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, confirmation: true, password_strong: true, on: :create
  validates :password, allow_blank: true, confirmation: true, password_strong: true, on: :update
  validates :phone, allow_blank: true, phone_number: true, on: :update

  scope :search, ->(key){where("email LIKE ? OR first_name LIKE ? OR last_name LIKE ? OR phone LIKE ?", "%#{key}%", "%#{key}%", "%#{key}%", "%#{key}%")}

  def downcase_email
    self.email = email.downcase
  end

  enum role_id: {user: 0, admin: 1, author: 2}
  has_many :comments, dependent: :destroy
 end
 