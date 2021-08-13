class Product < ApplicationRecord
  # validates :name, presence: true, length: { maximum: 255 }
  validate :add_error_product
  # scope :search_product, -> (search){ where("name LIKE ?", "%#{params[:search]}%") }
  scope :search_product, ->(search) { where("name LIKE ?", "%#{search}%") }

  belongs_to :user
  has_many :user_products, dependent: :destroy
  # has_many :registered_products, through: :user_products, source: :user
  has_many :product_contacts, dependent: :destroy
  has_many :product_documents, dependent: :destroy

  def add_error_product
    # errors[:base] << 'プロダクト名を入力してください' if name.blank?
    errors.add(:base, 'プロダクト名を入力してください') if name.blank?
    errors.add(:base, 'プロダクト名は255文字以内にしてください') if name.length > 255
  end
end
