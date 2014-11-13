module Api
  module V1
    class OrdersController < Api::V1::BaseController

      private
      def order_params
        if params[:order].size>0
          params.require(:order).permit(:order_date, :vat)
        end
          
      end

      def query_params
        params.permit(:order_date, :vat, :status)
      end

    end
  end
end