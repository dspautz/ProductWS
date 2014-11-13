json.products @products do |product|
  json.id   product.id
  json.name product.name
  json.net_price product.net_price
end