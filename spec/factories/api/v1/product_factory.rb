FactoryGirl.define do 
   factory :product do
    name "Pen"
    net_price  1.59
  end

  factory :pen, class: Product do
    name "Pen"
    net_price  1.59
  end
end