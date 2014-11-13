module Api
  module V1
    class StatusTransitionsController < Api::V1::BaseController

      private
      def status_transition_params
        params[:status_transition][:order_id]=params[:order_id]
        result = params.require(:status_transition).permit(:event, :order_id, :reason)      
      end

      def query_params
        params.permit(:event, :from, :to, :created_at)
      end

    end
  end
end