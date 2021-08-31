class Schedule < ApplicationRecord
  validates :serial_number,
            presence: true,
            uniqueness: true,
            length: { maximum: 255 }

  validate :number_check
  validate :before_after_date_check_line_completed
  validate :before_after_date_check_line_shipmented
  validate :before_after_date_check_line_deliveried
  validate :before_after_date_check_completed_shipmented
  validate :before_after_date_check_completed_deliveried
  validate :before_after_date_check_shipmented_deliveried

  def number_check
    errors.add(:base, "製品番号は半角英数字で入力してください") unless serial_number =~ /\A[a-z0-9-]+\z/
  end

  def before_after_date_check_line_completed
    if (line_on.present? && completed_on.present?) && (line_on > completed_on)
      errors.add(:base, "着手日か完了日の日付が正しいか確認してください") # if line_on > completed_on
      # flash[:notice] = errors.add(:line_on, "日付が正しいか確認してください") #if line_on > completed_on
      # flash[:notice] = "日付が正しいか確認してください"
    end
  end

  def before_after_date_check_line_shipmented
    errors.add(:base, "着手日か出荷日の日付が正しいか確認してください") if (line_on.present? && shipmented_on.present?) && (line_on > shipmented_on)
  end

  def before_after_date_check_line_deliveried
    errors.add(:base, "着手日か納品日の日付が正しいか確認してください") if (line_on.present? && deliveried_on.present?) && (line_on > deliveried_on)
  end

  def before_after_date_check_completed_shipmented
    errors.add(:base, "完了日か出荷日の日付が正しいか確認してください") if (completed_on.present? && shipmented_on.present?) && (completed_on > shipmented_on)
  end

  def before_after_date_check_completed_deliveried
    errors.add(:base, "完了日か納品日の日付が正しいか確認してください") if (completed_on.present? && deliveried_on.present?) && (completed_on > deliveried_on)
  end

  def before_after_date_check_shipmented_deliveried
    errors.add(:base, "出荷日か納品日の日付が正しいか確認してください") if (shipmented_on.present? && deliveried_on.present?) && (shipmented_on > deliveried_on)
  end

  belongs_to :customer
end
