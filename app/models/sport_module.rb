class SportModule < ActiveRecord::Base
  validates :code, presence: true, uniqueness: true
  validates :meetingPlace, presence: true, length: { minimum: 3 }
  validates :startTime, :endTime, presence: true,format:{with: /[1-2]{1}[0-9]{3}-[0-1]{1}[0-9]{1}-[0-3]{1}[0-9]{1} [0-2]{1}[0-9]{1}:[0-5]{1}[0-9]{1}:[0-5]{1}[0-9]{1} UTC/}
  validates :place, :activity, :coach, :day,  presence: true
  validates :maxSubscriptions, numericality: { only_integer: true, greater_than: 0 }

  belongs_to :place
  belongs_to :coach
  attr_accessor :subscriptions
  has_many :sport_module_subscriptions

  def self.with_paid_pending(eagerLoading)

    eagerLoading|=false

    if(eagerLoading)
      SportModule.includes(:sport_module_subscriptions).where('subscriptions.paid=? and subscriptions.dueDate >=?',true,Date.today).references(:sport_module_subscriptions)
    else
      SportModule.joins(:sport_module_subscriptions).where('subscriptions.paid=? and subscriptions.dueDate >=?',true,Date.today)
    end

  end

end
