class Customer < ApplicationRecord
  validates :number, :name, presence: true
  belongs_to :user
  has_many :user_customers, dependent: :destroy
  has_many :customer_members, through: :user_customers, source: :user
end
