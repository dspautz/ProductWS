require 'rails_helper'

RSpec.describe ItemLine, :type => :model do
  it "create a item line" do
    FactoryGirl.create(:pen)
    item_line = FactoryGirl.create(:item_line)
    
    expect(ItemLine.all).to eq([item_line])
  end
  
  it "delete item line" do
    FactoryGirl.create(:pen)
    item_line = FactoryGirl.create(:item_line)   
    
    expect {item_line.destroy}.to change(ItemLine, :count).by(-1)
  end
  
  
end