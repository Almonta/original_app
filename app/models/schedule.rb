class Schedule < ApplicationRecord
  belongs_to :customer
  validates :serial_number, presence: true
end
