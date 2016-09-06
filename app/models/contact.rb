class Contact

  include ActiveModel::Model

  attr_accessor :firstName, :lastName, :email, :message

  validates :firstName, :lastName, :email, :message,  presence: true
end