class CommentServices
  attr_reader :params, :flash, :current_user

  def initialize(params, flash, current_user)
    @params       = params
    @flash        = flash
    @current_user = current_user
  end

  def create
    article = find_article
    if comment_params[:content].blank?
      flash[:danger] = "add comment failed"
    else
      @comment = article.comments.create!(comment_params)
      flash[:success] = "add comment successfully"
    end
  end

  def destroy
    article   = find_article
    @comments = []
    @comments << article.comments.find_by(id: params[:id])
    @comments << article.comments.find_by(parent_id: params[:id])
    @comments.each do |comment|
      if comment != nil
        comment.destroy
      end  
    end  
  end

  def find_article
    return @article if @article
    @article = Article.find_by(id: params[:article_id])
  end
  
  def comment_params
    params.require(:comment).permit(:content, :parent_id, :status)
    .merge(user_id: @current_user.id)
  end
end  
