class Customer < ApplicationRecord
  validates :number, :name, presence: true
  belongs_to :user
  has_many :user_customers, dependent: :destroy
  # has_many :registered_customer, through: :user_customers, source: :user
  has_many :customer_contacts, dependent: :destroy
  has_many :customer_documents, dependent: :destroy
end
