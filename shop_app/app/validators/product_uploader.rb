class ProductUploader < CarrierWave::Uploader::Base

  include Cloudinary::CarrierWave

  process :convert => 'png'
  process :tags => ['post_picture']

  version :standard do
    process :resize_to_fill => [100, 150, :north]
  end

  version :thumbnail do
    resize_to_fit(50, 50)
  end
  # include CarrierWave::MiniMagick
  # process resize_to_limit: [500, 500]

  # storage :file

  # def store_dir
  #   "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  # end

  # def extension_white_list
  #   %w(jpg jpeg gif png)
  # end

end
