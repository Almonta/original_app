class AddLatitudeToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :latitude, :float
    add_column :customers, :longitude, :float
  end
end
