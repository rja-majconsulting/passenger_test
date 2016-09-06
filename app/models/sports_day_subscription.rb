class SportsDaySubscription < Subscription
  validates :sports_day_id, presence: true
  validates :dueDate,absence:true

  belongs_to :sports_day
end
