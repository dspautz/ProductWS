class StatusTransition < ActiveRecord::Base
  belongs_to :order
  before_save :set_order_state
  after_save :update_order_status
  attr_accessor :reason
  validates :reason, :presence => true, if: "event=='cancel'"

  def set_order_state

    @order = Order.find self.order_id

    if @order
    self.from = @order.status
    @order.send(self.event)
    self.to = @order.status
    end
  end
  
  def update_order_status
     @order.save
  end
end
