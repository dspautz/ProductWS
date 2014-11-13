json.status_transition do
  json.id   @status_transition.id
  json.from @status_transition.from
  json.to @status_transition.to
  json.created_at @status_transition.created_at
  
  json.order_id @status_transition.order ? @status_transition.order.id : nil
end