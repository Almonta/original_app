class ProductDocument < ApplicationRecord
  validates :name, presence: true, length: { maximum: 255 }
  validates :content, presence: true, length: { maximum: 1000 }
  validates :public_level, presence: true

  belongs_to :user
  belongs_to :product
  mount_uploader :document, DocumentUploader
end
