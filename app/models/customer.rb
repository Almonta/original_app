class Customer < ApplicationRecord
  validates :number, :name, presence: true, length: { maximum: 255 }
  validate :add_error_customer

  belongs_to :user
  has_many :user_customers, dependent: :destroy
  # has_many :registered_customer, through: :user_customers, source: :user
  has_many :customer_contacts, dependent: :destroy
  has_many :customer_documents, dependent: :destroy
  has_many :schedules, dependent: :destroy

  def add_error_customer
    errors.add(:base, 'カスタマーNoを入力してください') if number.blank?
    errors.add(:base, 'カスタマー名を入力してください') if name.blank?
    errors.add(:base, '文字数は255文字以内にしてください') if (name.length > 255) || (number.length > 255)
  end
end
