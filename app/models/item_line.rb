class ItemLine < ActiveRecord::Base
  belongs_to :order
  belongs_to :product  
  before_save :set_net_price, :check_order_status
  validates :quantity, :numericality => { :greater_than_or_equal_to => 1 }
  
  
  
  def set_net_price
    self.net_price = self.product.net_price
  end
  
  def check_order_status
    order = Order.find(self.order_id)
    if order.status!="DRAFT"
      errors[:base]<< "Can't update an Order in another status then DRAFT!"
      return false
    end
  end
end
