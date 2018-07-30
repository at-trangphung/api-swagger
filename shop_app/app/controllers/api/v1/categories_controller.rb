module Api::V1
  
  class CategoriesController < ApiController
    def index
      render json: Category.all
    end

    def categories_level_1
      @categories_level_1 = Category.where(parent_id: 0)
      if @categories_level_1.present?
        render json: @categories_level_1
      else
        render json: { message: "categories_level_1 can't be found!" }
      end
    end

    def categories_level_2
      @categories_level_2 = Category.find_by(parent_id: params[:parent_id])
      if @categories_level_2.present?
        render json: @categories_level_2
      else
        render json: { message: "categories_level_2 can't be found!" }
      end
    end
  end

end
