class Product < ApplicationRecord
  validates :name, presence: true
  belongs_to :user
  has_many :user_products, dependent: :destroy
  # has_many :registered_products, through: :user_products, source: :user
  has_many :product_contacts, dependent: :destroy
end
