require 'test_helper'

class SubscriptionTest < ActiveSupport::TestCase

  fixtures :swim_lesson_subscriptions
  fixtures :swim_lessons
  fixtures :levels
  fixtures :places

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
    assert subscription.errors[:type].any?
  end

  test 'email of the subscriber of a subscription has to be valid' do
    subscription = Subscription.new(type:'SwimLessonSubscription',firstName: 'test',lastName:'test',birthDate:'2009-11-02',city:'LLN',postalCode:1367,street:'street1')
    subscription.email ='test'
    assert subscription.invalid?
    assert subscription.errors[:email].any?

    subscription = Subscription.new(type:'SwimLessonSubscription',firstName: 'test',lastName:'test',birthDate:'2009-11-02',city:'LLN',postalCode:1367,street:'street1')
    subscription.email = 'test@test'
    assert subscription.invalid?
    assert subscription.errors[:email].any?

    subscription = Subscription.new(type:'SwimLessonSubscription',firstName: 'test',lastName:'test',birthDate:'2009-11-02',city:'LLN',postalCode:1367,street:'street1')
    subscription.email = 'test@test@gdsgf'
    assert subscription.invalid?
    assert subscription.errors[:email].any?

    subscription = Subscription.new(type:'SwimLessonSubscription',firstName: 'test',lastName:'test',birthDate:'2009-11-02',city:'LLN',postalCode:1367,street:'street1')
    subscription.email = 'test@gmail.com'
    subscription.valid?
    assert subscription.errors[:email].none?
  end

  test 'subscription must have a valid type' do
    subscription = Subscription.new(firstName: 'test',lastName:'test',birthDate:'2009-11-02',city:'LLN',postalCode:1367,street:'street1')
    assert subscription.invalid?
    assert subscription.errors[:type].any?
  end

end
