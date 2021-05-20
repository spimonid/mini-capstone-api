class OrderSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :subtotal, :tax, :total, :product

  belongs_to :product
end
