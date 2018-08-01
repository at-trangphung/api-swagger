module Api::V1
  
  class FavoritesController < ApiController
    before_action :authorization, only: [:create, :destroy]

    def create
      if check_like
        render json: {message: 'liked'}
      else  
        Favorite.create!( param_favorite )
        @product = find_product
        like = @product.like
        @product.update!( like: like + 1 )
        render json: {message: 'add like'}
      end  
    end

    def destroy
      if check_like
        Favorite.find_by( user_id: payload[0]['user_id'], product_id: params[:product_id] ).delete
        @product = find_product
        like = @product.like
        @product.update!( like: like - 1 )
        render json: {message: 'destroy like'}
      else
        render json: {message: 'dont like'}
      end  
    end

    private
    def check_like 
      Favorite.find_by( user_id: payload[0]['user_id'], product_id: params[:product_id] )
    end

    def param_favorite
      params.permit( :product_id ).merge(user_id: payload[0]['user_id'])
    end

    def find_product
      Product.find_by( id: params[:product_id] )
    end
  end
end
