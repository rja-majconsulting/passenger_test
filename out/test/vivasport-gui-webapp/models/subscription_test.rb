require 'test_helper'

class SubscriptionTest < ActiveSupport::TestCase

  test 'subscriber details of a subscription must not be empty' do

    subscription = Subscription.new
    assert subscription.invalid?
    assert subscription.errors[:firstName].any?
    assert subscription.errors[:lastName].any?
    assert subscription.errors[:birthDate].any?
    assert subscription.errors[:city].any?
    assert subscription.errors[:postalCode].any?
    assert subscription.errors[:street].any?
    assert subscription.errors[:email].any?
  end

  test 'email of the subscriber of a subscription must be valid' do

    subscription = Subscription.new(firstName: 'test',lastName:'test',birthDate:'2009-11-02',city:'LLN',postalCode:1367,street:'street1')

    subscription.email ='test'
    assert subscription.errors[:email].none?

    subscription.email = 'test@test'
    assert subscription.errors[:email].any?

    subscription.email = 'test@test@gdsgf'
    assert subscription.errors[:email].any?

    subscription.email = 'test@gmail.com'
    assert subscription.errors[:email].none

    subscription.email = 'test@yahoo.fr'
    assert subscription.errors[:email].none

    subscription.email = 'test@test.consulting'
    assert subscription.errors[:email].must_be_empty
  end



end
