FactoryGirl.define do 
  factory :item_line do
    quantity 1
    net_price  1.59
    product_id 1
    order_id 1
  end

  factory :pen_instance, class: ItemLine do
    quantity 1
    net_price  1.59
    product_id 1
    order_id 1
  end
  
  factory :paper_instance, class: ItemLine do
    quantity 3
    net_price  2.59
    product_id 1
    order_id 1
  end
  
end