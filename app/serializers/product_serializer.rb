class ProductSerializer < ActiveModel::Serializer
  attributes :id, :title, :price, :inventory, :total, :description, :is_discounted?

  belongs_to :supplier
  has_many :images
  has_many :categories
end
