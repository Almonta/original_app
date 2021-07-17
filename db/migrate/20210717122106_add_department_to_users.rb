class AddDepartmentToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :department, :integer, null: false, default: 0
  end
end
