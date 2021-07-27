class AddDocumentToProductDocuments < ActiveRecord::Migration[5.2]
  def change
    add_column :product_documents, :document, :text
  end
end
