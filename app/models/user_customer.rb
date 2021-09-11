class UserCustomer < ApplicationRecord
  belongs_to :user
  belongs_to :customer

  validates :user_id, uniqueness: { scope: :customer_id }
end
