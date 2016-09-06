require 'test_helper'

class SwimLessonSubscriptionTest < ActiveSupport::TestCase

  fixtures :swim_lessons

  test 'assert swill lesson subscription has to contains a swim lesson' do
    subscription = SwimLessonSubscription.new(type:'SwimLessonSubscription',email:'rja@mainsys.be',telefonNumber: '0497202012',firstName: 'test',lastName:'test',birthDate:'2009-11-02',city:'LLN',postalCode:1367,street:'street1')
    assert subscription.invalid?
    assert subscription.errors[:swim_lesson_id].any?
    assert_equal ["doit être rempli(e)"], subscription.errors.messages[:swim_lesson_id]
  end


  test 'swim subscription should be paid when due date and lesson assigned' do

    @subscription = SwimLessonSubscription.new(type:'SwimLessonSubscription',email:'rja@mainsys.be',firstName: 'test',lastName:'test',birthDate:'2009-11-02',city:'LLN',postalCode:1367,street:'street1')
    @subscription.dueDate= Date.tomorrow
    @subscription.swim_lesson=swim_lessons(:one)
    @subscription.paid=false

    assert @subscription.invalid?
    assert @subscription.errors[:base].any?
    assert_equal ['subscription has to be paid when lesson assigned and dueDate defined'] ,@subscription.errors.messages[:base]
  end
end
