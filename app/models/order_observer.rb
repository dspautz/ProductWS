class OrderObserver < ActiveRecord::Observer
  observe :order
  # Generic transition callback *after* the transition is performed
  def after_transition(order, transition)
  end
end