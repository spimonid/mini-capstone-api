class Supplier < ApplicationRecord
  validates :supplier_id, numericality: true
end
