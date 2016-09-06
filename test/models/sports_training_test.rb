require 'test_helper'
require 'date'
require 'i18n'

class SportsTrainingTest < ActiveSupport::TestCase

  fixtures :places
  fixtures :activities

  setup do
    @st = SportsTraining.new
  end


  test 'Sport training object structure must be valid' do
    Activity.create({id:1,name: "VTT", material: "Vélo, casque, gourde", maxSubscriptions: 15})
    Activity.create({id:2,name: "Judo", material: "Pijama", maxSubscriptions: 10})
    a3 = Activity.create({id:3,name: "Poney", material: "Bombe,cravache", maxSubscriptions: 18})
    p = Place.create({id:1,alias: "Piscine Farciennes", street: "Rue de la natation, 101", city: "Farciennes", postalCode: 6200})
    st = SportsTraining.new({id: 1, code: "001", place_id: 1, startDate: "04/07/2016", endDate: "04/07/2016", startTime: "2000-01-01 15:59:00", endTime: "2000-01-01 15:59:00", halfDayPrice: 50.0, fullDayPrice: 100.0, morningNursery: "Jumet", afternoonNursery: "Jumet"})
    st.morningActivity_ids= 1,2
    st.afternoonActivities << a3
    assert st.valid?
  end

end
