require 'rails_helper'

describe "StatusTransition API" do
  
  it 'retrieves all status transitions for a specific order' do
    FactoryGirl.create(:pen)
    FactoryGirl.create(:first_order)
    FactoryGirl.create(:pen_instance)  
    
    FactoryGirl.create(:place)
    FactoryGirl.create(:pay)
    
    api_get "orders/1/status_transitions", 1

    # test for the 200 status-code
    expect(response).to be_success
    
    expect(json['status_transitions'].length).to eq(2) 
    
    # ensure that private attributes aren't serialized
    expect(json['private_attr']).to eq(nil)
  end
end