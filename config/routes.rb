# The version can be determined from either the URL or HTTP headers. Look also to lib/api_constraint.rb
require 'api_constraints'

Rails.application.routes.draw do

  namespace :api , defaults: {format: 'json'} do
    
    # Example Calls
    # curl -X POST --header "Accept: application/product.sm.v1" --header "Content-Type: application/json" -d '{"product":{"name":"Pen", "net_price":"1.89"}}' http://localhost:3000/api/products
    # curl -X POST --header "Accept: application/product.sm.v2" --header "Content-Type: application/json" -d '{"product":{"name":"Pen", "net_price":"1.89"}}' http://localhost:3000/api/products

  # The Rails way for RESTfull versioning
    scope module: :v1, constraints: ApiConstraints.new(version: 1) do
      
      # curl -X POST --header "Accept: application/product.sm.v1" --header "Content-Type: application/json" -d '{"product":{"name": "Pen", "net_price":1.59}}' http://localhost:3000/api/products
      resources :products, only: [:index, :update, :create, :show, :destroy ]

      # curl -X POST --header "Accept: application/product.sm.v1" --header "Content-Type: application/json" -d '{"order":{}}' http://localhost:3000/api/orders
      # curl -X PUT --header "Accept: application/product.sm.v1" --header "Content-Type: application/json" -d '{"order":{"vat":40}}' http://localhost:3000/api/orders/1
      resources :orders, only: [:index, :update, :create, :show ] do
        resources :item_lines, only: [:show, :index, :destroy, :update, :create]
        
        # curl -X POST --header "Accept: application/product.sm.v1" --header "Content-Type: application/json" -d '{"status_transition":{"event":"cancel"}}' http://localhost:3000/api/orders/2/status_transitions
        resources :status_transitions, only: [:index, :create ]
      end
    end

    # Not implemented yet. 
    # Reject with ActionController::RoutingError (uninitialized constant Api::V2):
    # Could be prevent by set 'default: true' within ApiConstraint at scope module: v1
    # Only for demonstrate
    scope module: :v2, constraints: ApiConstraints.new(version: 2) do
      resources :products, only: [:index, :update, :create, :show, :destroy ]

      resources :orders, only: [:index, :update, :create, :show ] do
        resources :item_lines, only: [:show, :index, :destroy, :update, :create]
        resources :status_transitions, only: [:index, :create ]
      end
    end
    
    
  # Alternative versioning
  
  # Example Calls
  # curl -X POST --header "Accept: application/json" --header "Content-Type: application/json" -d '{"product":{"name":"Pen", "net_price":"1.89"}}' http://localhost:3000/api/v1/products
  # curl -X POST --header "Accept: application/json" --header "Content-Type: application/json" -d '{"product":{"name":"Pen", "net_price":"1.89"}}' http://localhost:3000/api/v2/products

  #namespace :v1 do
  #  resources :products, only: [:index, :update, :create, :show, :destroy ]

  #  resources :orders, only: [:index, :update, :create, :show ] do
  #    resources :line_items, only: [:show, :index, :destroy, :update, :create]
  #    resources :status_transitions, only: [:index, :create ]
  #  end
  #end

  #namespace :v2 do
  #  resources :products, only: [:index, :update, :create, :show, :destroy ]

  #  resources :orders, only: [:index, :update, :create, :show ] do
  #    resources :line_items, only: [:show, :index, :destroy, :update, :create]
  #    resources :status_transitions, only: [:index, :create ]
  #  end
  #end
  end
end
