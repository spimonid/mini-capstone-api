class Product < ApplicationRecord
  def is_discounted?
    discount = false
    if price.to_i < 10
      discount = true
    end
    discount
  end

  def tax
    (price.to_i * 0.07).round(2)
  end

  def total
    price + tax
  end
end
