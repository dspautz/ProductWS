require 'rails_helper'

RSpec.describe Product, :type => :model do
  it "create product" do
    product = FactoryGirl.create(:product)     
    expect(Product.find_by_name("Pen")).to eq(product)
  end
  
  it "delete product" do
    product = FactoryGirl.create(:product)     
    expect {product.destroy}.to change(Product, :count).by(-1)
  end
  
  
end
