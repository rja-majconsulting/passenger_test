require 'test_helper'

class SportsTrainingSubscriptionTest < ActiveSupport::TestCase

  fixtures :sports_trainings

  test 'paid cannot be empty' do

    sts = SportsTrainingSubscription.new({type: "SportsTrainingSubscription", lastName: "Test", firstName: "test", birthDate: "2016-07-05", street: "Test rue", city: "Test ville", postalCode: 6200, telefonNumber: "0479868569", email: "test@test.com", comment: nil, paid: true, sport_module_id: nil, sports_training:sports_trainings(:one), swim_lesson_id: nil, sports_day_id: nil, place_id: nil, level_id: nil, activity_morning_id: 4, activity_afternoon_id: 2, dueDate: nil})
    assert sts.valid?

    sts.paid=false
    assert sts.valid?

    sts.paid=nil
    assert sts.invalid?
    assert_equal ['n\'est pas inclus(e) dans la liste'],sts.errors.messages[:paid]
  end


end
