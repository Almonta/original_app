class ProductDocument < ApplicationRecord
  validates :name, :content, :public_level, presence: true
  belongs_to :user
  belongs_to :product
end
