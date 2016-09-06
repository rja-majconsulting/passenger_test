class Place < ActiveRecord::Base
  validates :alias, :street, presence: true, length: { minimum: 4 }
  validates :city, presence: true, length: { minimum: 3 }
  validates :postalCode, numericality: { only_integer: true, greater_than: 0 }, length: { minimum: 4 }
end
