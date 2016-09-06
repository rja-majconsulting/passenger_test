class SportsTrainingSubscription < Subscription
  validates :sports_training, presence: true
  validates :activity_morning_id, presence: true, if: 'activity_afternoon_id=nil?'
  validates :activity_afternoon_id, presence: true, if: 'activity_morning_id=nil?'
  validates :dueDate,absence:true

  belongs_to :sports_training

end
