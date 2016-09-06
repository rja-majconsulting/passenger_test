class Activity < ActiveRecord::Base
  validates :name, :material, presence: true, length: { minimum: 3 }
  validates :maxSubscriptions, numericality: { only_integer: true, greater_than: 0 }
end
