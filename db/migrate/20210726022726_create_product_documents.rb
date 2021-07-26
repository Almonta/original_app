class CreateProductDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :product_documents do |t|
      t.references :user, foreign_key: true
      t.references :product, foreign_key: true
      t.string :name
      t.text :content
      t.integer :public_level

      t.timestamps
    end
  end
end
