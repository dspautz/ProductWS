require 'rails_helper'

describe "Products API" do
  
  it 'sends a list of products' do
    FactoryGirl.create_list(:product, 10)

    api_get 'products', 1

    expect(response).to be_success            # test for the 200 status-code
    expect(json['products'].length).to eq(10) 
  end
  
  it 'retrieves a specific product' do
    product = FactoryGirl.create(:product)    
    api_get "products/#{product.id}", 1

    # test for the 200 status-code
    expect(response).to be_success

    # check that the order attributes are the same.
    expect(json['product']['name']).to eq(product.name) 
    expect(json['product']['net_price']).to eq(product.net_price.to_s)

    # ensure that private attributes aren't serialized
    expect(json['private_attr']).to eq(nil)
  end
end