class OrdersController < ApplicationController
  before_action :authenticate_user

  def index
    render json: current_user.orders, include: "carted_products.product"
  end

  def show
    order = current_user.orders.find_by(id: params["id"])
    render json: order, include: "carted_products.product"
  end

  def create
    carted_products = current_user.carted_products.where(status: "carted")

    calculated_subtotal = 0
    calculated_tax = 0
    carted_products.each do |carted_product|
      product = carted_product.product
      price = product.price
      tax = product.tax
      quantity = carted_product.quantity
      calculated_subtotal += quantity * price
      calculated_tax += quantity * tax
    end
    calculated_total = calculated_subtotal + calculated_tax

    order = Order.new(
      user_id: current_user.id,
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      total: calculated_total,
    )
    order.save

    # carted_products.each do |carted_product|
    #   # carted_product.status = "purchased"
    #   # carted_product.order_id = order.id
    #   # carted_product.save
    #   carted_product.update(status: "purchased", order_id: order.id)
    # end
    carted_products.update_all(status: "purchased", order_id: order.id)

    render json: order, include: "carted_products.product"
  end
end
