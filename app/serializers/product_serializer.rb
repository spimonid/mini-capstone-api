class ProductSerializer < ActiveModel::Serializer
  attributes :id, :title, :total, :description, :is_discounted?
end
