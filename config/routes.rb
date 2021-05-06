Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/all_products", controller: "products", action: "all_products"
  get "/one_product", controller: "products", action: "one_product_method"
  get "/query_product/:id", controller: "products", action: "query_product"

  post "/body", controller: "body_params", action: "send_secret"
end
