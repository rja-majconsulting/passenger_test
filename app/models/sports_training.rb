class SportsTraining < ActiveRecord::Base
  validates :code, presence: true, uniqueness: true
  validates :morningNursery, :afternoonNursery, presence: true, length: { minimum: 3 }
  validates :startTime, :endTime, presence: true,format:{with: /[1-2]{1}[0-9]{3}-[0-1]{1}[0-9]{1}-[0-3]{1}[0-9]{1} [0-2]{1}[0-9]{1}:[0-5]{1}[0-9]{1}:[0-5]{1}[0-9]{1} UTC/}
  validates :startDate, :endDate, presence: true, format: {with: /[0-3]{1}[0-9]{1}\/[0-1]{1}[0-9]{1}\/[1-2]{1}[0-9]{3}/}
  validates :place, :morningActivities, :afternoonActivities, presence: true
  validates :halfDayPrice, :fullDayPrice, numericality: { greater_than: 0 }

  belongs_to :place
  has_many :morningActivities, -> { where(sports_training_activities: { period: 'AM' }) }, :through => :sports_training_activities, :source => 'activity', :autosave => true, :dependent => :destroy
  has_many :afternoonActivities, -> { where(sports_training_activities: { period: 'PM' }) },  :through => :sports_training_activities, :source => 'activity', :autosave => true, :dependent => :destroy
  has_many :sports_training_activities
  attr_accessor :subscriptions



end
