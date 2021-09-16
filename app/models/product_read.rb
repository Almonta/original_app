class ProductRead < ApplicationRecord
  belongs_to :user
  belongs_to :product_contact
end
