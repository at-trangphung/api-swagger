module Api::V1
  class CommentsProductController < ApiController
    def index
      @product  = Product.find_by(id: params[:product_id], status: "exist")
      @comments = @product.comment_products.where(parent_id: 0)
      render json: @comments
    end

    def create
      @product = Product.find_by(id: params[:product_id], status: "exist")
      @comment = @product.comment_products.create!(comment_params)
      render json: @comment
    end

    def destroy
      @product  = Product.find_by(id: params[:product_id])
      @comments = []
      @comments << @product.comment_products.find_by(id: params[:id])
      @comments << @product.comment_products.find_by(parent_id: params[:parent_id])
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
