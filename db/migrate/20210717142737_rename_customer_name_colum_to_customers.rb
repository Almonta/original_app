class RenameCustomerNameColumToCustomers < ActiveRecord::Migration[5.2]
  def change
    rename_column :customers, :customer_name, :name
  end
end
