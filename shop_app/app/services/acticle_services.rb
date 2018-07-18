class ActicleServices

  def initialize(params)
    @params = params
  end

  def get_acticle
    Article.find(@params[:id])
  end
end