class Coach < ActiveRecord::Base
  validates :lastName, :firstName, presence: true, length: { minimum: 3 }
  validates :telefonNumber, presence: true, numericality: { only_integer: true, greater_than: 0 }, length: { minimum: 9, maximum: 10 }
  validates :email, presence: true, email: true
end
