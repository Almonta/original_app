json.extract! product_document, :id, :user_id, :product_id, :name, :content, :public_level, :created_at, :updated_at
json.url product_document_url(product_document, format: :json)
