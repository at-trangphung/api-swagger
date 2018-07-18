class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  # mount_uploader :image_link, ProductUploader
end
