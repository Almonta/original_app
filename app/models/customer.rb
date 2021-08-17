class Customer < ApplicationRecord
  validates :number,
    presence: true,
    uniqueness: true,
    length: { maximum: 255 }
  validates :name,
    presence: true,
    length: { maximum: 255 }

  # validate :add_error_customer

  belongs_to :user
  has_many :user_customers, dependent: :destroy
  # has_many :registered_customer, through: :user_customers, source: :user
  has_many :customer_contacts, dependent: :destroy
  has_many :customer_documents, dependent: :destroy
  has_many :schedules, dependent: :destroy

  # def add_error_customer
  #   if number.blank?
  #     errors.add(:number, 'カスタマーNoを入力してください')
  #   # elsif Customer.where(number: number).present?
  #     # errors.add(:number, '既に登録済のカスタマーNoです。')
  #   elsif number.length > 255
  #     errors.add(:number, '文字数は255文字以内にしてください')
  #   end
  #   if name.blank?
  #     errors.add(:name, 'カスタマー名を入力してください')
  #   elsif name.length > 255
  #     errors.add(:name, '文字数は255文字以内にしてください')
  #   end
  # end
end
