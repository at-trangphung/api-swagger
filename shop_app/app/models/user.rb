class User < ApplicationRecord
  has_secure_password validations: false
  attr_accessor :activation_token, :reset_token

  mount_uploader :avatar
  before_save   :downcase_email
  before_create :create_activation_digest

  validates :first_name, presence: true, name: true
  validates :last_name, presence: true, name: true
  validates :email, presence: true, email: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, confirmation: true, password_strong: true, on: :create
  validates :password, allow_blank: true, confirmation: true, password_strong: true, on: :update
  validates :phone, allow_blank: true, phone_number: true, on: :update
  validate  :picture_size
  #strong params
  # USER_PARAMS = [user: {:email, :password, :password_confirmation, :first_name, :last_name}]
  # belongs_to :role
  has_many :comments
  has_many :articles, through: :comments
  has_many :customers
  has_many :favorites, dependent: :destroy

  def downcase_email
    self.email = email.downcase
  end

  def create_activation_digest
    self.activation_token  = User.new_token
    self.activation_digest = User.digest(activation_token)
  end

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns a random token.
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def authenticated?(attribute, token)
    digest = self.send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

    # Activates an account.
  def activate
    # update_columns(activated: FILL_IN, activated_at: FILL_IN)

    update_attribute(:activated,    true)
    update_attribute(:activated_at, Time.zone.now)
  end

  # Sends email.
  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end

  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end
  
  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest, User.digest(reset_digest))
    update_attribute(:reset_sent_at, Time.zone.now)
  end
 
  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end

  def picture_size
    if avatar.size > 5.megabytes
      errors.add(:avatar, "should be less than 5MB")
    end
  end
  
end
