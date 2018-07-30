class CommentAritcleSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :article_id, :content
end
