class ProductsController < ApplicationController
  before_action :authenticate_admin, except: [:index, :show]

  def index
    render json: Product.all
  end

  def show
    product = Product.find_by(id: params["id"])
    render json: product
  end

  def create
    product = Product.new(
      title: params["title"],
      price: params["price"],
      description: params["description"],
      supplier_id: params["supplier_id"],
    )
    if product.save
      Image.create(product_id: product.id, url: params[:image_url])
      render json: product
    else
      render json: { errors: product.errors.full_messages }, status: 422
    end
  end

  def update
    product = Product.find_by(id: params["id"])
    product.title = params["title"] || product.title
    product.price = params["price"] || product.price
    product.description = params["description"] || product.description
    product.supplier_id = params["supplier_id"] || product.supplier_id

    if product.save
      Image.create(product_id: product.id, url: params[:image_url])
      render json: product
    else
      render json: { errors: product.errors.full_messages }, status: 422
    end
  end

  def destroy
    product = Product.find_by(id: params["id"])
    product.destroy
  end
end
