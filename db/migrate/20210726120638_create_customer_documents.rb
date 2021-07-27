class CreateCustomerDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :customer_documents do |t|
      t.string :name
      t.text :content
      t.integer :public_level
      t.references :user, foreign_key: true
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
