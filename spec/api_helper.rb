 def api_get action, version="1"
    get "/api/#{action}", {}, {"Accept" => "application/product.sm.v#{version}"}
   # JSON.parse(response.body) rescue {}
  end

  def api_post action, version="1"
    post "/api/#{action}", {}, {"Accept" => "application/product.sm.v#{version}"}
   # JSON.parse(response.body) rescue {}
  end

  def api_delete action, version="1"
    delete "/api/#{action}", {}, {"Accept" => "application/product.sm.v#{version}"}
   # JSON.parse(response.body) rescue {}
  end

  def api_put action, version="1"
    put "/api/#{action}", {}, {"Accept" => "application/product.sm.v#{version}"}
   # JSON.parse(response.body) rescue {}
  end