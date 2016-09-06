class SportsDay < ActiveRecord::Base
  validates :code, presence: true, uniqueness: true
  validates :morningPlace, :afternoonPlace, presence: true, length: { minimum: 3 }
  validates :startTime, :endTime, presence: true,format:{with: /[1-2]{1}[0-9]{3}-[0-1]{1}[0-9]{1}-[0-3]{1}[0-9]{1} [0-2]{1}[0-9]{1}:[0-5]{1}[0-9]{1}:[0-5]{1}[0-9]{1} UTC/}
  validates :date, :paymentDate, presence: true, format: {with: /[0-3]{1}[0-9]{1}\/[0-1]{1}[0-9]{1}\/[1-2]{1}[0-9]{3}/}
  validates :place,  presence: true
  validates :price, numericality: { greater_than: 0 }

  attr_accessor :subscriptions
  belongs_to :place
end
