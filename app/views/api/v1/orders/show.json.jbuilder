json.order do
  json.id    @order.id
  json.order_date @order.order_date
  json.vat @order.vat
  json.status @order.status
end
