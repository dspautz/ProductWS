require 'rails_helper'

RSpec.describe Order, :type => :model do
  it "create order" do
    order = FactoryGirl.create(:order)       
    expect(Order.all).to eq([order])
  end
  
  it "delete order" do
    order = FactoryGirl.create(:order)        
    expect {order.destroy}.to change(Order, :count).by(-1)
  end
  
  it "update order" do
    order = FactoryGirl.create(:order)
    order.vat = 40        
    expect {order.update}.to change(Order, :vat).to(40)
  end
  
  
end