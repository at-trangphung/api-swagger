class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :status, :parent_id
end
