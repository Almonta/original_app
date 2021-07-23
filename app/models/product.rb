class Product < ApplicationRecord
  validates :name, presence: true
  belongs_to :user
  has_many :user_products, dependent: :destroy
  has_many :product_members, through: :user_product, source: :user
end
