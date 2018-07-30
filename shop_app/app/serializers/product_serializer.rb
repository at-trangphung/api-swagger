class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :image_link, :description, :like
end
