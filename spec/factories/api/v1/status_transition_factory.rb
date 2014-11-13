FactoryGirl.define do 
    factory :status_transition do
    event "place"
    from  "DRAFT"
    to "PLACED"
    order_id 1
  end

  factory :place, class: StatusTransition do
    event "place"
    order_id 1
  end
  
  factory :pay, class: StatusTransition do
    event "pay"
    order_id 1
  end
  
  factory :cancel, class: StatusTransition do
    event "cancel"
    order_id 1
  end
end