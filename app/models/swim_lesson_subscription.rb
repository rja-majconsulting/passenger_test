class SwimLessonSubscription < Subscription

  before_validation :check_paid


  validates :place,:level,presence: true, if: 'swim_lesson_id=nil?'
  validate :swim_subscription_must_be_paid_when_dueDate_is_defined_and_lesson_assigned

  belongs_to :swim_lesson

  def swim_subscription_must_be_paid_when_dueDate_is_defined_and_lesson_assigned
    if paid ===false && dueDate.present? && swim_lesson_id.present?
      errors.add(:base, 'subscription has to be paid when lesson assigned and dueDate defined')
    end
  end

  def self.waiting_availability
    self.where(:swim_lesson_id => nil)
  end

  def self.waiting_payment
    self.where(:paid => false).where.not(:swim_lesson_id => nil)
  end

  private

  def check_paid
    if self.swim_lesson_id != nil and self.dueDate != nil and self.dueDate >= Date.today
      self.paid = true
    end
  end

end
