class Schedule < ApplicationRecord
  validates :serial_number, 
    presence: true,
    # presence: {message: "空です"}, 
    uniqueness: true,
    length: { maximum: 255 }

  if :line_on.present? && :completed_on.present?
    validate :before_after_date_check_line_completed
  end
  if (:line_on != nil && :shipmented_on != nil) || (:completed_on != nil && :shipmented_on != nil)
    validate :before_after_date_check_completed_shipmented
  end
  if (:line_on.present? && :deliveried_on.present?) || (:completed_on.present? && :deliveried_on.present?) || (:shipmented_on.present? && :deliveried_on.present?)
    validate :before_after_date_check_shipmentted_delivered
  end

  def before_after_date_check_line_completed
    errors.add(:line_on, "日付が正しいか確認してください") if line_on > completed_on
  end

  def before_after_date_check_completed_shipmented
    errors.add(:completed_on, "日付が正しいか確認してください") if (line_on > shipmented_on) || (completed_on > shipmented_on)
  end

  def before_after_date_check_shipmentted_delivered
    errors.add(:shipmented_on, "日付が正しいか確認してください") if (line_on > deliveried_on) || (completed_on > deliveried_on) || (shipmented_on > deliveried_on)
  end

  belongs_to :customer
end
