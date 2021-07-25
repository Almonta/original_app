class CustomerContact < ApplicationRecord
  belongs_to :customer
  belongs_to :user
  validates :contact_message, presence: true
end
