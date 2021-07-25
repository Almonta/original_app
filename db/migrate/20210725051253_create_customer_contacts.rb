class CreateCustomerContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :customer_contacts do |t|
      t.references :customer, foreign_key: true
      t.references :user, foreign_key: true
      t.text :contact_message

      t.timestamps
    end
  end
end
