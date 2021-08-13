class Schedule < ApplicationRecord
  validates :serial_number, 
    presence: true,
    # presence: {message: "空です"}, 
    uniqueness: true,
    length: { maximum: 255 }

    validate :before_after_date_check_line_completed
    validate :before_after_date_check_line_shipmented
    validate :before_after_date_check_line_deliveried
    validate :before_after_date_check_completed_shipmented
    validate :before_after_date_check_completed_deliveried
    validate :before_after_date_check_shipmented_deliveried
  
  def before_after_date_check_line_completed
    if (self.line_on.present? && self.completed_on.present?) && (self.line_on > self.completed_on)
      errors.add(:base, "着手日か完了日の日付が正しいか確認してください") #if line_on > completed_on
      # flash[:notice] = errors.add(:line_on, "日付が正しいか確認してください") #if line_on > completed_on
      # flash[:notice] = "日付が正しいか確認してください"
    end
  end

  def before_after_date_check_line_shipmented
    if (self.line_on.present? && self.shipmented_on.present?) && (self.line_on > self.shipmented_on)
      errors.add(:base, "着手日か日付が正しいか確認してください")
    end
  end

  def before_after_date_check_line_deliveried
    if (self.line_on.present? && self.deliveried_on.present?) && (self.line_on > self.deliveried_on)
      errors.add(:base, "日付が正しいか確認してください")
    end
  end

  def before_after_date_check_completed_shipmented
    if (self.completed_on.present? && self.shipmented_on.present?) && (self.completed_on > self.shipmented_on)
      errors.add(:base, "日付が正しいか確認してください")
    end
  end

  def before_after_date_check_completed_deliveried
    if (self.completed_on.present? && self.deliveried_on.present?) && (self.completed_on > self.deliveried_on)
      errors.add(:base, "日付が正しいか確認してください")
    end
  end

  def before_after_date_check_shipmented_deliveried
    if (self.shipmented_on.present? && self.deliveried_on.present?) && (self.shipmented_on > self.deliveried_on)
      errors.add(:base, "日付が正しいか確認してください")
    end
  end

  belongs_to :customer
end
