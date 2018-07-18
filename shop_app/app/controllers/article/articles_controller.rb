class Article::ArticlesController < BaseController
  layout 'customer'
  before_action :load_service

  def index
    @categories = Category.where(parent_id: 0)
    @articles   = Article.all.paginate page: params[:page], per_page: 9
  end

  def show
    @article  = @service_acticle.get_acticle
    @comments = @article.comments.where(parent_id: 0, status: 1)
                .paginate page: params[:page], per_page: 3
  end

  private
  
  def load_service
    @service_acticle = ActicleServices.new(params)
  end
end
