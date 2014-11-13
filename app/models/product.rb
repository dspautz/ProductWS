class Product < ActiveRecord::Base
  has_many :item_lines
  
  before_destroy :check_depends
  
  validates :name, :presence => true
  validates :net_price, :presence => true
  
  
  def check_depends
    if self.item_lines && self.item_lines.length==0
      errors[:base]<< "Can't destroy the product because There are some Orders depend on it!"
      return false
    end
  end
  
end
