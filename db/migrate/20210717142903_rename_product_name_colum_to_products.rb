class RenameProductNameColumToProducts < ActiveRecord::Migration[5.2]
  def change
    rename_column :products, :product_name, :name
  end
end
