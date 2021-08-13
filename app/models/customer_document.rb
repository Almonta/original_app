class CustomerDocument < ApplicationRecord
  validates :name, presence: true, length: { maximum: 255 }
  validates :content, presence: true, length: { maximum: 1000 }
  validates :public_level, presence: true
  validate :add_error_customer_document

  belongs_to :user
  belongs_to :customer
  mount_uploader :document, DocumentUploader

  def add_error_customer_document
    errors.add(:base, '資料名を入力してください') if name.blank?
    errors.add(:base, '概要を入力してください') if content.blank?
    errors.add(:base, '公開レベルを選択してしてください') if public_level.blank?
    errors.add(:base, 'プロダクト名は255文字以内にしてください') if name.length > 255
  end
end
