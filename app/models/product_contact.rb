class ProductContact < ApplicationRecord
  belongs_to :product
  validates :contact_message, presence: true
end
