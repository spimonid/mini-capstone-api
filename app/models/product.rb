class Product < ApplicationRecord
  validates :name, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :description, length: { in: 6..50  }

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
