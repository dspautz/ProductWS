require 'rails_helper'

#RSpec.describe API::V1::ProductsController, :type => :controller do
#  describe "GET #index" do
#    it "responds successfully with an HTTP 200 status code" do
#      get :index
#      expect(response).to be_success
#      expect(response).to have_http_status(200)
#    end##
#
#    it "renders the index json response" do
#      get :index
#      expect(response).to render_json
#    end#
#
#    it "loads all of the products into @products" do
#      product1, product2 = product = Product.create!(name: "Pen", net_price: 1.59), product = Product.create!(name: "Paper", net_price: 2.59)
#      get :index#
#
#      expect(assigns(:products)).to match_array([product1, product2])
#    end
#  end
#end
