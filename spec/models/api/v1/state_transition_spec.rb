require 'rails_helper'

RSpec.describe StatusTransition, :type => :model do
  it "create status transition" do
    FactoryGirl.create(:pen)
    FactoryGirl.create(:first_order)
    FactoryGirl.create(:pen_instance)  
    
    state_transition = FactoryGirl.create(:place)
    
    expect(StatusTransition.all).to eq([state_transition])
  end
  
  it "delete status transition" do
    FactoryGirl.create(:pen)
    FactoryGirl.create(:first_order)
    FactoryGirl.create(:pen_instance)  
    
    state_transition = FactoryGirl.create(:place)  
    
    expect {state_transition.destroy}.to change(StatusTransition, :count).by(-1)
  end
  
  
end