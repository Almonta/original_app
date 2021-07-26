json.extract! customer_document, :id, :name, :content, :public_level, :user_id, :customer_id, :created_at, :updated_at
json.url customer_document_url(customer_document, format: :json)
