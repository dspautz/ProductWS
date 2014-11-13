FactoryGirl.define do 
 factory :order do
    status "DRAFT"
    order_date  Time.now
    vat 20
  end

  factory :first_order, class: Order do
    status "DRAFT"
    order_date  Time.now
    vat 20
  end
  
  
  
  
 
  
 
end