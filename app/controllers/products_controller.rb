class ProductsController < ApplicationController
  def index
    products = Product.all
    render json: products.as_json
  end

  def show
    product = Product.find_by(id: params["id"])
    render json: product.as_json
  end

  def create
    product = Product.new(
      title: params["title"],
      price: params["price"],
      image_url: params["image_url"],
      description: params["description"],
    )
    product.save
    render json: product.as_json
  end

  def update
    product = Product.find_by(id: params["id"])
    new_title = params["user_title"]
    product.title = new_title
    render json: product.title.as_json
  end

  def destroy
    product = Product.find_by(id: params["id"])
    #product = #product minus product[id]
    #????
  end
end
