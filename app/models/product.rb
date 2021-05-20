class Product < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :description, presence: true
  validates :description, length: { in: 10..500 }

  belongs_to :supplier

  has_many :images

  has_many :orders

  has_many :category_products

  has_many :categories, through: :category_products

  def is_discounted?
    price.to_i < 10
  end

  def tax
    (price.to_i * 0.07).round(2)
  end

  def total
    price + tax
  end
end
