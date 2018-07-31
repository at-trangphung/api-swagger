module Api::V1
  class CommentsProductController < ApiController
    before_action :authorization, only: [:create_comment_product, :destroy]
    def index
      @product  = Product.find_by(id: params[:product_id], status: "exist")
      @comments = @product.comment_products
      render json: @comments
    end

    def create_comment_product
      @product = Product.find_by(id: params[:product][:product_id], status: "exist")
      @comment = @product.comment_products.create!(comment_params)
      render json: @comment
    end

    def destroy
      @product  = Product.find_by(id: params[:product_id])
      @comments = []
      @comments << @product.comment_products.find_by(id: params[:comment_id])
      @comments << @product.comment_products.find_by(parent_id: params[:comment_id])
      @comments.each do |comment|
        if comment != nil
          comment.destroy
        end  
      end
      if @comments.compact!.nil?
        render json: { message: 'successfully!'}
      else
        render json: { message: 'failed!'}
      end
    end
    
    private
      def comment_params
        params.permit(:content, :parent_id).merge(user_id: payload[0]['user_id'])
      end
  end  
end
