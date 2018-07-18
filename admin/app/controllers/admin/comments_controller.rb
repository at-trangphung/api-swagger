class Admin::CommentsController < AdminController
  before_action :load_service
  
  def index
    @comments = @service_comment.load_list_comments
  end

  def update
    @service_comment.update_comment
    redirect_to comments_path
  end

  private
  def load_service
    @service_comment = CommentServices.new(params, flash)
  end
end
