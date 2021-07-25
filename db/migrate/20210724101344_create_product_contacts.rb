class CreateProductContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :product_contacts do |t|
      t.references :product, foreign_key: true
      t.text :contact_message

      t.timestamps
    end
  end
end
