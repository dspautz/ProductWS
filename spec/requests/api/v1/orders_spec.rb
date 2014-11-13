require 'rails_helper'

describe "Orders API" do
  
  it 'sends a list of orders' do
    FactoryGirl.create_list(:order, 10)

    api_get 'orders', 1

    expect(response).to be_success            # test for the 200 status-code
    #json = JSON.parse(response.body)
    expect(json['orders'].length).to eq(10) 
  end
  
  it 'retrieves a specific order' do
    order = FactoryGirl.create(:order)    
    api_get "orders/#{order.id}", 1

    # test for the 200 status-code
    expect(response).to be_success

    # check that the order attributes are the same.
    expect(json['order']['status']).to eq(order.status) 
   # expect(json['order']['order_date']).to eq(order.order_date)
    expect(json['order']['vat']).to eq(order.vat)

    # ensure that private attributes aren't serialized
    expect(json['private_attr']).to eq(nil)
  end
end
