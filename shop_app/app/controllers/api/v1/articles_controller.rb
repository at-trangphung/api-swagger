module Api::V1
  class ArticlesController < ApiController

    def index
      @articles = Article.all
      render json: @articles
    end

    def show
      binding.pry
      @article = Article.find_by(id: params[:id])
      if @article.present?
        render json: @article
      else
        render json: { message: "Not found!" }
      end
    end
  end
end