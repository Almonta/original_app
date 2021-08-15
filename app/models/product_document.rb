class ProductDocument < ApplicationRecord
  # validates :name, presence: true, length: { maximum: 255 }
  # validates :content, presence: true, length: { maximum: 1000 }
  # validates :public_level, presence: true
  validate :add_error_product_document

  belongs_to :user
  belongs_to :product
  mount_uploader :document, DocumentUploader

  def add_error_product_document
    errors.add(:base, '資料名を入力してください') if name.blank?
    errors.add(:base, '概要を入力してください') if content.blank?
    errors.add(:base, '公開レベルを選択してください') if public_level.blank?
    errors.add(:base, 'プロダクト名は255文字以内にしてください') if name.length > 255
    errors.add(:base, '概要は1000文字以内にしてください') if content.length > 1000
  end
end
