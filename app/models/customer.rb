class Customer < ApplicationRecord
  validates :number, :name, presence: true
  belongs_to :user
end
