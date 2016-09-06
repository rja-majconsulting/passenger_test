class SportModuleSubscription < Subscription
  validates :sport_module,:sport_module_id, presence: true
  validate :sport_module_subscription_must_be_paid_when_dueDate_is_defined_and_lesson_assigned

  belongs_to :sport_module


  def sport_module_subscription_must_be_paid_when_dueDate_is_defined_and_lesson_assigned
    if paid ===false && dueDate.present?
      errors.add(:base, 'sport module subscription has to be paid when lesson assigned and dueDate defined')
    end
  end
end
