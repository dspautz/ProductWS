require 'rails_helper'

describe "ItemLine API" do
  
  it 'sends a list of item lines' do
    FactoryGirl.create(:pen)
    FactoryGirl.create(:first_order)
    FactoryGirl.create_list(:item_line, 10)

    api_get 'orders/1/item_lines', 1
    
    expect(response).to be_success            
    expect(json['item_lines'].length).to eq(10) 
  end
  
  it 'retrieves a specific line_item' do
    FactoryGirl.create(:pen)
    FactoryGirl.create(:first_order)
    item_line = FactoryGirl.create(:pen_instance)    
    
    api_get "orders/1/item_lines/#{item_line.id}", 1

    # test for the 200 status-code
    expect(response).to be_success
    
    
    # check that the order attributes are the same.
    expect(json['item_line']['quantity']).to eq(item_line.quantity) 
   # expect(json['order']['order_date']).to eq(order.order_date)
    expect(json['item_line']['net_price']).to eq(item_line.net_price.to_s)
    expect(json['item_line']['product_id']).to eq(item_line.product.id)
    expect(json['item_line']['order_id']).to eq(item_line.order.id)

    # ensure that private attributes aren't serialized
    expect(json['private_attr']).to eq(nil)
  end
end