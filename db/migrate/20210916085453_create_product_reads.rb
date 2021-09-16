class CreateProductReads < ActiveRecord::Migration[5.2]
  def change
    create_table :product_reads do |t|
      t.references :user, foreign_key: true
      t.references :product_contact, foreign_key: true
      t.boolean :complete, null:false
      t.timestamps
    end
  end
end
