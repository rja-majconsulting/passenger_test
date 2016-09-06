class SwimLesson < ActiveRecord::Base
  validates :code, presence: true, uniqueness: true
  validates :category, presence: true, length: { minimum: 3 }
  validates :startTime, :endTime, presence: true,format:{with: /[1-2]{1}[0-9]{3}-[0-1]{1}[0-9]{1}-[0-3]{1}[0-9]{1} [0-2]{1}[0-9]{1}:[0-5]{1}[0-9]{1}:[0-5]{1}[0-9]{1} UTC/}
  validates :place, :level, :coach, :day,  presence: true
  validates :maxSubscriptions, numericality: { only_integer: true, greater_than: 0 }

  belongs_to :place
  belongs_to :level
  belongs_to :coach
  has_many :swim_lesson_subscriptions
  attr_accessor :subscriptions

  def self.paid_pending_by_category(swim_lesson_category,include_lessons_without_subscription)

    if(include_lessons_without_subscription)
      SwimLesson.includes(:swim_lesson_subscriptions).where('category=? and ((subscriptions.paid is null and subscriptions.dueDate is null) or (subscriptions.paid=? and subscriptions.dueDate>=?))',swim_lesson_category,true,Date.today).order(:code).references(:swim_lesson_subscriptions)
    else
      SwimLesson.includes(:swim_lesson_subscriptions).where('category=? and subscriptions.paid=? and subscriptions.dueDate>=?',swim_lesson_category,true,Date.today).order(:code).references(:swim_lesson_subscriptions)
    end


  end
end
