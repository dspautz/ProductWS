require 'rails_helper'

describe "State Machine" do

  before do
    @order = FactoryGirl.create(:order)

    @product_1 = FactoryGirl.create(:product, name: 'Pen', net_price: 1.59)
    @product_2 = FactoryGirl.create(:product, name: 'Paper', net_price: 3.59)
    @product_3 = FactoryGirl.create(:product, name: 'Ruler', net_price: 1.29)

    @line_item_1 = FactoryGirl.create(:item_line, quantity: 3, product_id: @product_1.id)
    @line_item_2 = FactoryGirl.create(:item_line, quantity: 2, product_id: @product_2.id)
    @line_item_3 = FactoryGirl.create(:item_line, quantity: 2, product_id: @product_3.id)

  end

  context "without cancel state" do
    it "set order state to DRAFT" do
      expect(Order.find(@order.id).status).to eq("DRAFT")

      post "/api/orders/#{@order.id}/status_transitions", {:status_transition => {event: "place"}} , {"Accept" => "application/product.sm.v1"}
      expect(Order.find(@order.id).status).to eq("PLACED")
   
      post "/api/orders/#{@order.id}/status_transitions", {:status_transition => {event: "pay"}}, {"Accept" => "application/product.sm.v1"}
      expect(Order.find(@order.id).status).to eq("PAID")
    end
  end
  
  context "with cancel after DRAFT" do
    it "set order state to DRAFT" do
      expect(Order.find(@order.id).status).to eq("DRAFT")

      post "/api/orders/#{@order.id}/status_transitions", {:status_transition => {event: "cancel"}} , {"Accept" => "application/product.sm.v1"}
      expect(Order.find(@order.id).status).to eq("CANCELED")
    end
  end
  
  context "with cancel after DRAFT" do
    it "set order state to DRAFT" do
      expect(Order.find(@order.id).status).to eq("DRAFT")

      post "/api/orders/#{@order.id}/status_transitions", {:status_transition => {event: "place"}} , {"Accept" => "application/product.sm.v1"}
      expect(Order.find(@order.id).status).to eq("PLACED")
      
      post "/api/orders/#{@order.id}/status_transitions", {:status_transition => {event: "cancel"}} , {"Accept" => "application/product.sm.v1"}
      expect(Order.find(@order.id).status).to eq("CANCELED")
    end
  end
end