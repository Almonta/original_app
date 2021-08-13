class Schedule < ApplicationRecord
  validates :serial_number, 
    presence: true,
    # presence: {message: "空です"}, 
    uniqueness: true,
    length: { maximum: 255 }
  belongs_to :customer
end
