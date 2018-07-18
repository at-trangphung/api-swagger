class Admin::ArticlesController < AdminController
  before_action :load_service
  
  def index
    @articles = @service_article.load_list_article
  end

  def new
    @article = Article.new
  end

  def create
    @service_article.create_article
    redirect_to articles_path
  end

  def edit
    @articles = @service_article.load_list_article
    @article  = @service_article.find_article
  end

  def update
    @service_article.update_article
    redirect_to articles_path
  end

  def destroy
    @service_article.destroy_article
    redirect_to articles_path
  end

  private
  def load_service
    @service_article  = ArticleServices.new(params, flash)
  end
end
