class Product < ApplicationRecord
  validates :name, 
    presence: true,
    uniqueness: true
    length: { maximum: 255 }

  # validate :add_error_product
  scope :search_product, ->(search) { where("name LIKE ?", "%#{search}%") }

  belongs_to :user
  has_many :user_products, dependent: :destroy
  # has_many :registered_products, through: :user_products, source: :user
  has_many :product_contacts, dependent: :destroy
  has_many :product_documents, dependent: :destroy

  # def add_error_product
  #   if name.blank?
  #     errors.add(:name, 'プロダクト名を入力してください。')
  #   elsif name.length > 255
  #     errors.add(:name, 'プロダクト名は255文字以内にしてください。')
  #   end
  #   errors.add(:base, '既に登録済のプロダクト名です。') if Product.where(name: name).present?
  # end
end
