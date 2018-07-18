# module Services
  class ShopServices
    attr_reader :params

    def initialize(params)
      @params = params
      # @current_user = current_user
    end

    def search_product
      unless params[:search] == ''
        @productList = Product.all
        @listProduct = Array.new
        @productList.map do |product|
          if (params[:search][ 0, params[:search].length ]).casecmp?(product.name[ 0, params[:search].length ])
            @listProduct << product
          end
        end
      end
      @listProduct
    end

  end
# end
