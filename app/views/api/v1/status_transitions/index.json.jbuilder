json.status_transitions @status_transitions do |status_transition|
  json.id    status_transition.id
  json.from status_transition.from
  json.to status_transition.to
  json.event status_transition.event
  json.created_at status_transition.created_at
  
  json.order_id status_transition.order ? status_transition.order.id : nil
end
