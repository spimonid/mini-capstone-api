class ChangeDataTypeDescription < ActiveRecord::Migration[6.1]
  def change
    change_column :products, :description, :text
    change_column :products, :price, :decimal, precision: 5, scale: 2
  end
end
