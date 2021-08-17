class CustomerDocument < ApplicationRecord
  validates :name, presence: true, length: { maximum: 255 }
  validates :content, presence: true, length: { maximum: 1000 }
  validates :public_level, presence: true
  # validate :add_error_customer_document

  belongs_to :user
  belongs_to :customer
  mount_uploader :document, DocumentUploader

  # def add_error_customer_document
  #   if name.blank?
  #     errors.add(:name, '資料名を入力してください')
  #   elsif name.length > 255
  #     errors.add(:name, 'プロダクト名は255文字以内にしてください')
  #   end
  #   if content.blank?
  #     errors.add(:content, '概要を入力してください')
  #   elsif content.length > 1000
  #     errors.add(:content, '概要は1000文字以内にしてください')
  #   end
  #   errors.add(:public_level, '公開レベルを選択してください') if public_level.blank?
  # end
end
