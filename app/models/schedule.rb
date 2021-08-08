class Schedule < ApplicationRecord
  validates :serial_number, presence: true, length: { maximum: 255 }
  belongs_to :customer
end
