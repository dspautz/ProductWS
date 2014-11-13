class Order < ActiveRecord::Base
  has_many :status_transitions
  has_many :item_lines
  
  before_update :check_status
  
  state_machine :status, :initial => :DRAFT do
    
    event :place do
      transition :DRAFT => :PLACED
      #StatusTransition.create(event: :place, from: :DRAFT, to: :PLACED, order: self)
    end
    
    event :cancel do
      transition [:DRAFT, :PLACED] => :CANCELED
      #StatusTransition.create(event: :cancel, from: :DRAFT, to: :CANCELED, order: self)
    end
    
    event :pay do
      transition :PLACED => :PAID
      #StatusTransition.create(event: :pay, from: :PLACED, to: :PAID, order: self)
    end
    
  end
  
  
  def  check_status
    if self.status!="DRAFT"
      errors[:base]<< "Can't update an Order in another status then DRAFT!"
      return false
    end
  end
  
end


