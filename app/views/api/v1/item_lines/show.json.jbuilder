json.item_line do
  json.id    @item_line.id
  json.quantity @item_line.quantity
  json.net_price @item_line.net_price
  
  json.order_id @item_line.order ? @item_line.order.id : nil
  json.product_id @item_line.product ? @item_line.product.id : nil
end
