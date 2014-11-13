module Api
  module V1
    class ItemLinesController < Api::V1::BaseController

      private
      def item_line_params
        params[:item_line][:order_id]=params[:order_id]
        params.require(:item_line).permit(:quantity, :net_price, :product_id, :order_id)
      end

      def query_params
        params.permit(:quantity, :net_price, :product_id, :order_id)
      end

    end
  end
end