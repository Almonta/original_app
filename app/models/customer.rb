class Customer < ApplicationRecord
  validates :number, :name, presence: true
end
