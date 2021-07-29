class AddDocumentToCustomerDocuments < ActiveRecord::Migration[5.2]
  def change
    add_column :customer_documents, :document, :text
  end
end
