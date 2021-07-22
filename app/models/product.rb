class Product < ApplicationRecord
  validates :name, presence: true
  has_many :users
  has_many :user_products, dependent: :destroy
  has_many :product_members, through: :user_product, source: :user
end
