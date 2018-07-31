class CommentProductSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :product_id, :content
end
