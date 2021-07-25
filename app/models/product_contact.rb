class ProductContact < ApplicationRecord
  belongs_to :user
  belongs_to :product
  validates :contact_message, presence: true
end
