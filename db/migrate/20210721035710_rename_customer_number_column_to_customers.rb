class RenameCustomerNumberColumnToCustomers < ActiveRecord::Migration[5.2]
  def change
    rename_column :customers, :customer_number, :number
  end
end
