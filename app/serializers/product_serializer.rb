class ProductSerializer < ActiveModel::Serializer
  attributes :id, :title, :total, :description, :supplier_id, :is_discounted?

  belongs_to :supplier
  has_many :images
end
