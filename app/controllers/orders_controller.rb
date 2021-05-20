class OrdersController < ApplicationController
  before_action :authenticate_user

  def index
    render json: current_user.orders
  end

  def show
    order = current_user.orders.find_by(id: params["id"])
    render json: order
  end

  def create
    product = Product.find_by(id: params["product_id"])
    subtotal = product.price * params["quantity"].to_i
    tax = subtotal * 0.09
    total = subtotal + tax
    order = Order.new(
      user_id: current_user.id,
      product_id: params["product_id"],
      quantity: params["quantity"],
      subtotal: subtotal,
      tax: tax,
      total: total,
    )
    order.save
    render json: order
  end
end
