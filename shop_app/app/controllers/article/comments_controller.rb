class Article::CommentsController < BaseController
  layout 'customer'
  before_action :load_service

  def new
    @comment = Comment.new
  end

  def create
    @service_comment.create
    article = @service_comment.find_article
    redirect_to article_path(article)
  end

  def destroy
    @service_comment.destroy
    article = @service_comment.find_article
    redirect_to article_path(article)
  end

  private

    def load_service
      @service_comment = CommentServices.new(params, flash, @service_user.current_user)
    end
end
