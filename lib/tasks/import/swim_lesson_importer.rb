module SwimLessonImporter

  # import users
  def import_swim_lesson
    puts "Importing swim lesson..."
    ActiveRecord::Base.establish_connection(@oldDb)
    lessons = ActiveRecord::Base.connection.execute("
      SELECT id_lesson, code, place, instructor, level, day, beginHour, endHour, maxSubscriptions FROM ADM_lesson where deleted='N'
      ")


    for i in 0...lessons.count do
      ActiveRecord::Base.establish_connection(@oldDb)

      row = lessons.get_row i

      ActiveRecord::Base.establish_connection(:development)
      lesson = SwimLesson.new(id: row.get("id_lesson"),
                      code: row.get("code"),
                      place_id: row.get("place"),
                      level_id: row.get("level"),
                      coach_id: row.get("instructor"),
                      startTime: row.get("beginHour"),
                      endTime: row.get("endHour"),
                      day: convert_day(row.get("day")),
                      maxSubscriptions: row.get("maxSubscriptions"),
                      category: row.get("code").chop)

      lesson.save!
    end
  end
end
