class ArticleServices
  attr_reader :params, :flash

  def initialize(params, flash)
    @params = params
    @flash  = flash
  end

  def create_article
    string   = split_string
    @article = Article.new article_params
    if @article.save
      upload_images
      @article.update!(image_link: string)
      flash[:success] = "add successfully"
    end
  end

  def update_article
    @article = find_article
    string   = split_string 
    if @article.update(article_params)
      upload_images
      @article.update!(image_link: string)
      flash[:success] = "update successfully"
    end  
  end

  def destroy_article
    article = find_article
    if article.destroy!
      flash[:success] = "deleted successfully"
    end
  end

  def article_params
    params.require(:article).permit(:title, :content, :image_link)
  end

  def upload_images
    @uploads = {}

    @uploads[:image_article] = Cloudinary::Uploader.upload(
      article_params[:image_link], 
      :public_id => article_params[:image_link].original_filename.split('.')[0])
  end

  def load_list_article
    Article.all.paginate(page: params[:page], per_page: 2)
  end

  def find_article
    Article.find_by(id: params[:id])
  end

  def split_string
    return string = article_params[:image_link].original_filename.split('.')[0]
  end
end
