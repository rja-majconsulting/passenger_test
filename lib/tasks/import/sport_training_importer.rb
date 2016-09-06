module SportTrainingImporter

  # import users
  def import_sport_training
    puts "Importing sport trainings..."
    ActiveRecord::Base.establish_connection(@oldDb)
    trainings = ActiveRecord::Base.connection.execute("
      SELECT id_stage, code, beginDate, endDate, beginHour, endHour, place, halfPrice, fullPrice, gardeAM, gardePM FROM ADM_stage where deleted='N'
      ")


    for i in 0...trainings.count do
      ActiveRecord::Base.establish_connection(@oldDb)

      row = trainings.get_row i

      sport_training_morning_activity = ActiveRecord::Base.connection.execute("
      SELECT activity FROM ADM_activity_stage where stage='" + row.get("id_stage").to_s + "' AND period='AM'
      ")
      morning_activities = Array.new
      afternoon_activities = Array.new

      for j in 0...sport_training_morning_activity.count do
        morning_activities.push((sport_training_morning_activity.get_row j).get("activity"))
      end

      sport_training_afternoon_activity = ActiveRecord::Base.connection.execute("
      SELECT activity FROM ADM_activity_stage where stage='" + row.get("id_stage").to_s + "' AND period='PM'
      ")

      for j in 0...sport_training_afternoon_activity.count do
        afternoon_activities.push((sport_training_afternoon_activity.get_row j).get("activity"))
      end

      ActiveRecord::Base.establish_connection(:development)
      sport_training = SportsTraining.new(id: row.get("id_stage"),
                      code: row.get("code"),
                      place_id: row.get("place"),
                      startDate: row.get("beginDate"),
                      endDate: row.get("endDate"),
                      startTime: row.get("beginHour"),
                      endTime: row.get("endHour"),
                      halfDayPrice: row.get("halfPrice"),
                      fullDayPrice: row.get("fullPrice"),
                      morningNursery: row.get("gardeAM"),
                      afternoonNursery: row.get("gardePM"),
                      morningActivity_ids: morning_activities,
                      afternoonActivity_ids: afternoon_activities)

      sport_training.save!
    end
  end
end
