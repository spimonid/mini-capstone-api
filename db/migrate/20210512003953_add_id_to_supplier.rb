class AddIdToSupplier < ActiveRecord::Migration[6.1]
  def change
    add_column :suppliers, :id, :integer
  end
end
