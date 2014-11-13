module Api
  module V1
    class ProductsController < Api::V1::BaseController

      private
      def product_params
        if params[:product].size>0
          params.require(:product).permit(:name, :net_price)
        end
      end

      def query_params
        params.permit(:name, :net_price)
      end

    end
  end
end