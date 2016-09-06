# User.create!([
#   {email: "test@test.com", encrypted_password: "$2a$11$6A0x3l1OXvhsLju/.KO88.iNGtht5uA19bAiNfpDVgBsqr.d.UC6G", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 12, current_sign_in_at: "2016-07-26 14:04:42", last_sign_in_at: "2016-07-10 12:22:19", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1"},
#   {email: "raphael.jammart@gmail.com", encrypted_password: "$2a$11$IzrL6PT/JxRm8kBBcjdFduNnhv8H9e0yRblqNBfxxS2.awxbKHsk6", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 2, current_sign_in_at: "2016-07-17 15:44:33", last_sign_in_at: "2016-07-15 13:21:27", current_sign_in_ip: "::1", last_sign_in_ip: "127.0.0.1"}
# ])

# user = User.create! :email => 'john@gmail.com', :password => 'topsecret', :password_confirmation => 'topsecret'
# user = User.create! :email => 'rja@gmail.com', :password => 'topsecret', :password_confirmation => 'topsecret'
# user = User.create! :email => 'marchetti.sebastien@gmail.com', :password => 'topsecret', :password_confirmation => 'topsecret'

activities = Activity.create!([
  {id:1,name: "VTT", material: "Vélo, casque, gourde", maxSubscriptions: 15},
  {id:2,name: "Judo", material: "Pijama", maxSubscriptions: 10}
])
Coach.create!([
  {id:1,lastName: "Marchetti", firstName: "Sébastien", telefonNumber: "0479868569", email: "marchetti.sebastien@gmail.com"}
])
Level.create!([
  {id:1,name: "Peur de l'eau"},
  {id:2,name: "Franc"}
])
Place.create!([
  {id:1,alias: "Piscine Farciennes", street: "Rue de la natation, 101", city: "Farciennes", postalCode: 6200},
  {id:2,alias: "Test lieu", street: "Test rue", city: "Test ville", postalCode: 6200}
])
SportModule.create!([
  {id:1,code: "001", place_id: 1, activity: "ZUMBA", coach_id: 1, day: "0", startTime: "2000-01-01 09:30:00", endTime: "2000-01-01 10:00:00", maxSubscriptions: 10, meetingPlace: "Parking piscine"},
  {id:2,code: "002", place_id: 1, activity: "TENNIS", coach_id: 1, day: "1", startTime: "2000-01-01 13:00:00", endTime: "2000-01-01 16:00:00", maxSubscriptions: 10, meetingPlace: "Parking piscine"}
])


SportsDay.create!([{id:1,code: "001", place_id: 1, date: "2016-07-04", price: "100.0", startTime: "2000-01-01 14:45:00", endTime: "2000-01-01 14:45:00", morningPlace: "Test", afternoonPlace: "Test2", paymentDate: Date.tomorrow}])

st = SportsTraining.new({id: 1, code: "001", place_id: 1, startDate: "04/07/2016", endDate: "04/07/2016", startTime: "2000-01-01 15:59:00", endTime: "2000-01-01 15:59:00", halfDayPrice: "50.0", fullDayPrice: "100.0", morningNursery: "Jumet", afternoonNursery: "Jumet"})
st.morningActivity_ids = 1,2
st.afternoonActivity_ids=2
st.save!

st = SportsTraining.new({id: 2, code: "002", place_id: 2, startDate: "04/07/2016", endDate: "04/07/2016", startTime: "2000-01-01 08:31:00", endTime: "2000-01-01 08:31:00", halfDayPrice: "50.0", fullDayPrice: "100.0", morningNursery: "Jumet", afternoonNursery: "Test"})
st.morningActivity_ids = 1,2
st.afternoonActivity_ids=1
st.save!

st = SportsTraining.new({id: 3, code: "003", place_id: 1, startDate: "04/07/2016", endDate: "04/07/2016", startTime: "2000-01-01 11:38:00", endTime: "2000-01-01 11:38:00", halfDayPrice: "50.0", fullDayPrice: "100.0", morningNursery: "Jumet", afternoonNursery: "Test"})
st.morningActivity_ids = 1,2
st.afternoonActivity_ids=1,2
st.save!

SwimLesson.create!([
  {id:1,code: "H5.12", place_id: 1, level_id: 1, coach_id: 1, day: "6", startTime: "2000-01-01 10:00:00", endTime: "2000-01-01 10:30:00", maxSubscriptions: 10, category: "H5.1"},
  {id:2,code: "H5.11", place_id: 1, level_id: 1, coach_id: 1, day: "1", startTime: "2000-01-01 12:40:00", endTime: "2000-01-01 13:40:00", maxSubscriptions: 10, category: "H5.1"},
  {id:3,code: "H5.13", place_id: 1, level_id: 1, coach_id: 1, day: "2", startTime: "2000-01-01 13:40:00", endTime: "2000-01-01 14:40:00", maxSubscriptions: 10, category: "H5.1"},
  {id:4,code: "H5.14", place_id: 1, level_id: 1, coach_id: 1, day: "3", startTime: "2000-01-01 14:40:00", endTime: "2000-01-01 06:40:00", maxSubscriptions: 10, category: "H5.1"},
  {id:5,code: "H5.112", place_id: 1, level_id: 1, coach_id: 1, day: "1", startTime: "2000-01-01 06:40:00", endTime: "2000-01-01 06:40:00", maxSubscriptions: 10, category: "H5.11"}
])

Subscription.create!([
  {type: "SportsTrainingSubscription", lastName: "Test", firstName: "test", birthDate: "2016-07-05", street: "Test rue", city: "Test ville", postalCode: 6200, telefonNumber: "0479868569", email: "test@test.com", comment: nil, paid: true, sport_module_id: nil, sports_training_id:1, swim_lesson_id: nil, sports_day_id: nil, place_id: nil, level_id: nil, activity_morning_id: 1, activity_afternoon_id: 2, dueDate: nil},
  {type: "SportsTrainingSubscription", lastName: "Marchetti", firstName: "Sébastien", birthDate: "2016-07-06", street: "Tingremont, 85", city: "Nalinnes", postalCode: 6120, telefonNumber: "0479868569", email: "marchetti.sebastien@gmail.com", comment: nil, paid: true, sport_module_id: nil, sports_training_id:2, swim_lesson_id: nil, sports_day_id: nil, place_id: nil, level_id: nil, activity_morning_id: 2, activity_afternoon_id: 1, dueDate: nil},
  {type: "SportsTrainingSubscription", lastName: "Jammart", firstName: "Raphaël", birthDate: "1979-06-17", street: "Rue des Fripiers,16", city: "Huppaye", postalCode: 1367, telefonNumber: "0479202018", email: "raphael.jammart@gmail.com", comment: nil, paid: true, sport_module_id: nil, sports_training_id:3, swim_lesson_id: nil, sports_day_id: nil, place_id: nil, level_id: nil, activity_morning_id: 2, activity_afternoon_id: 1, dueDate: nil},
  {type: "SportsDaySubscription", lastName: "toto", firstName: "tata", birthDate: "2016-07-05", street: "Test rue", city: "Test ville", postalCode: 6200, telefonNumber: "0479868569", email: "marchetti.sebastien@gmail.com", comment: nil, paid: true, sport_module_id: nil, sports_training_id: nil, swim_lesson_id: nil, sports_day_id: 7, place_id: nil, level_id: nil, activity_morning_id: nil, activity_afternoon_id: nil, dueDate: nil},
  {type: "SportsDaySubscription", lastName: "Marchetti", firstName: "Sébastien", birthDate: "2016-07-06", street: "Tingremont, 85", city: "Nalinnes", postalCode: 6120, telefonNumber: "0479868569", email: "marchetti.sebastien@gmail.com", comment: nil, paid: false, sport_module_id: nil, sports_training_id: nil, swim_lesson_id: nil, sports_day_id: 4, place_id: nil, level_id: nil, activity_morning_id: nil, activity_afternoon_id: nil, dueDate: nil},
  {type: "SportsDaySubscription", lastName: "Marchetti", firstName: "Toto", birthDate: "06-06-1945", street: "Tingremont, 87", city: "Gembloux", postalCode: 5030, telefonNumber: "0479868569", email: "marchetti.toto@gmail.com", comment: nil, paid: true, sport_module_id: nil, sports_training_id: nil, swim_lesson_id: nil, sports_day_id: 4, place_id: nil, level_id: nil, activity_morning_id: nil, activity_afternoon_id: nil, dueDate: nil},
  {type: "SportModuleSubscription", lastName: "Tata1", firstName: "Tatat", birthDate: "2016-07-08", street: "Tingremont, 85", city: "Nalinnes", postalCode: 6120, telefonNumber: "0479868569", email: "marchetti.sebastien@gmail.com", comment: nil, paid: true, sport_module_id: 1, sports_training_id: nil, swim_lesson_id: nil, sports_day_id: nil, place_id: nil, level_id: nil, activity_morning_id: nil, activity_afternoon_id: nil, dueDate: Date.yesterday},
  {type: "SportModuleSubscription", lastName: "Tata2", firstName: "Tatat", birthDate: "2016-07-08", street: "Tingremont, 85", city: "Nalinnes", postalCode: 6120, telefonNumber: "0479868569", email: "marchetti.sebastien@gmail.com", comment: nil, paid: true, sport_module_id: 2, sports_training_id: nil, swim_lesson_id: nil, sports_day_id: nil, place_id: nil, level_id: nil, activity_morning_id: nil, activity_afternoon_id: nil, dueDate: Date.today},
  {type: "SportModuleSubscription", lastName: "Tata3", firstName: "Tatat", birthDate: "2016-07-08", street: "Tingremont, 85", city: "Nalinnes", postalCode: 6120, telefonNumber: "0479868569", email: "marchetti.sebastien@gmail.com", comment: nil, paid: true, sport_module_id: 1, sports_training_id: nil, swim_lesson_id: nil, sports_day_id: nil, place_id: nil, level_id: nil, activity_morning_id: nil, activity_afternoon_id: nil, dueDate: Date.tomorrow},
  {type: "SportModuleSubscription", lastName: "Tata4", firstName: "Tatat", birthDate: "2016-07-08", street: "Tingremont, 85", city: "Nalinnes", postalCode: 6120, telefonNumber: "0479868569", email: "marchetti.sebastien@gmail.com", comment: nil, paid: false, sport_module_id: 2, sports_training_id: nil, swim_lesson_id: nil, sports_day_id: nil, place_id: nil, level_id: nil, activity_morning_id: nil, activity_afternoon_id: nil, dueDate: nil},
  {type: "SwimLessonSubscription", lastName: "Toto1", firstName: "Coutunio", birthDate: "2016-07-09", street: "Tingremont, 85", city: "Nalinnes", postalCode: 6120, telefonNumber: "0479868569", email: "marchetti.sebastien@gmail.com", comment: nil, paid: true, sport_module_id: nil, sports_training_id: nil, swim_lesson_id: 1, sports_day_id: nil, place_id: 1, level_id: 1, activity_morning_id: nil, activity_afternoon_id: nil, dueDate: Date.tomorrow},
  {type: "SwimLessonSubscription", lastName: "Toto2", firstName: "tata", birthDate: "2016-07-09", street: "Tingremont, 85", city: "Nalinnes", postalCode: 6120, telefonNumber: "0479868569", email: "marchetti.sebastien@gmail.com", comment: nil, paid: true, sport_module_id: nil, sports_training_id: nil, swim_lesson_id: 2, sports_day_id: nil, place_id: 1, level_id: 1, activity_morning_id: nil, activity_afternoon_id: nil, dueDate: Date.tomorrow},
  {type: "SwimLessonSubscription", lastName: "Toto3", firstName: "titi", birthDate: "2016-07-09", street: "Tingremont, 85", city: "Nalinnes", postalCode: 6120, telefonNumber: "0479868569", email: "marchetti.sebastien@gmail.com", comment: nil, paid: true, sport_module_id: 1, sports_training_id: nil, swim_lesson_id: 2, sports_day_id: nil, place_id: 1, level_id: 1, activity_morning_id: nil, activity_afternoon_id: nil, dueDate: Date.tomorrow},
  {type: "SwimLessonSubscription", lastName: "Marchetti", firstName: "Sébastien", birthDate: "2016-07-10", street: "Tingremont, 85", city: "Nalinnes", postalCode: 6120, telefonNumber: "0479868569", email: "marchetti.sebastien@gmail.com", comment: nil, paid: true, sport_module_id: nil, sports_training_id: nil, swim_lesson_id: 4, sports_day_id: nil, place_id: 2, level_id: 2, activity_morning_id: nil, activity_afternoon_id: nil, dueDate: Date.tomorrow},
  {type: "SwimLessonSubscription", lastName: "Marchetti", firstName: "Sébastien", birthDate: "2016-07-10", street: "Tingremont, 85", city: "Nalinnes", postalCode: 6120, telefonNumber: "0479868569", email: "marchetti.sebastien@gmail.com", comment: nil, paid: true, sport_module_id: nil, sports_training_id: nil, swim_lesson_id: 4, sports_day_id: nil, place_id: 2, level_id: 2, activity_morning_id: nil, activity_afternoon_id: nil, dueDate: Date.yesterday},
  {type: "SwimLessonSubscription", lastName: "Marchetti", firstName: "Sébastien", birthDate: "2016-07-10", street: "Tingremont, 85", city: "Nalinnes", postalCode: 6120, telefonNumber: "0479868569", email: "marchetti.sebastien@gmail.com", comment: nil, paid: false, sport_module_id: nil, sports_training_id: nil, swim_lesson_id: nil, sports_day_id: nil, place_id: 1, level_id: 1, activity_morning_id: nil, activity_afternoon_id: nil, dueDate: nil},
  {type: "SwimLessonSubscription", lastName: "Marchetti", firstName: "Sébastien", birthDate: "2016-07-10", street: "Tingremont, 85", city: "Nalinnes", postalCode: 6120, telefonNumber: "0479868569", email: "marchetti.sebastien@gmail.com", comment: nil, paid: false, sport_module_id: nil, sports_training_id: nil, swim_lesson_id: nil, sports_day_id: nil, place_id: 1, level_id: 1, activity_morning_id: nil, activity_afternoon_id: nil, dueDate: nil}
])




