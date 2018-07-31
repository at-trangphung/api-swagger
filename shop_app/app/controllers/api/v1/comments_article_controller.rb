module Api::V1
  class CommentsArticleController < ApiController
    
    def index
      @article  = Article.find_by(id: params[:article_id])
      @comments = @article.comments.where(parent_id: 0, status: 1)
      render json: @comments
    end

    def create
      @article = Article.find_by(id: params[:article_id])
      @comment = @article.comments.create!(comment_params)
      render json: @comment
    end

    def destroy
      @article   = Article.find_by(id: params[:article_id])
      @comments = []
      @comments << @article.comments.find_by(id: params[:id])
      @comments << @article.comments.find_by(parent_id: params[:parent_id])
      @comments.each do |comment|
        if comment != nil
          comment.destroy
        end  
      end
      if @comments.compact!.nil?
        render json: { message: 'failed!'}
      else
        render json: { message: 'successfully!'}
      end
    end
    
    private
      def comment_params
        params.permit(:content, :parent_id).merge(user_id: payload[0]['user_id'])
      end
  end  
end