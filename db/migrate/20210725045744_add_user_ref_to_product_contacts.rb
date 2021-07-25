class AddUserRefToProductContacts < ActiveRecord::Migration[5.2]
  def change
    add_reference :product_contacts, :user, foreign_key: true
  end
end
