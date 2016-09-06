class Subscription < ActiveRecord::Base

  validates :type,:firstName,:lastName,:birthDate,:city,:street, presence: true
  validates :email, presence: true, email: true
  validates :telefonNumber, presence: true, numericality: { only_integer: true, greater_than: 0 }, length: { minimum: 9, maximum: 10 }
  validates :postalCode, numericality: { only_integer: true, greater_than: 0 }, length: { minimum: 4 }
  validates_inclusion_of :type, :in => %w(SwimLessonSubscription SportModuleSubscription SportsDaySubscription SportsTrainingSubscription)
  validates :paid, inclusion: { in: [ true, false ] }

  belongs_to :place
  belongs_to :level
  belongs_to :activity, :foreign_key => :activity_morning_id
  belongs_to :activity, :foreign_key => :activity_afternoon_id

  def self.not_renewed
    self.where('"dueDate" IS NOT NULL AND "dueDate" < ?',Date.today)
  end

  def self.latest
    self.order(:created_at).last
  end

  def self.waiting_payment
    self.where(:paid => false)
  end

  def self.search(lastName, firstName)
    if lastName or firstName
      self.where('lastName LIKE ? AND firstName LIKE ?', "%#{lastName}%","%#{firstName}%")
    else
      nil
    end
  end

end
