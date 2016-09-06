module SportModuleImporter

  # import users
  def import_sport_module
    puts "Importing sport modules..."
    ActiveRecord::Base.establish_connection(@oldDb)
    modules = ActiveRecord::Base.connection.execute("
      SELECT id_module, code, place, activity, instructor, day, beginHour, endHour, maxSubscriptions, apt_place FROM ADM_module WHERE deleted='N'
      ")

    ActiveRecord::Base.establish_connection(:development)
    for i in 0...modules.count do
      row = modules.get_row i

      sport_module = SportModule.new(id: row.get("id_module"),
                      code: row.get("code"),
                      place_id: row.get("place"),
                      activity: convert_activity(row.get("activity")),
                      coach_id: row.get("instructor"),
                      day: convert_day(row.get("day")),
                      startTime: row.get("beginHour"),
                      endTime: row.get("endHour"),
                      maxSubscriptions: row.get("maxSubscriptions"),
                      meetingPlace: row.get("apt_place"))
      sport_module.save!
    end
  end


  def convert_activity(activity)
    new_activity = ''
    case activity
      when 'Zumba'
        new_activity='ZUMBA'
      when 'Multisports'
        new_activity='MULTISPORTS'
      when 'Mini-tennis'
        new_activity='TENNIS'
      when 'Mini-foot'
        new_activity='FOOTBALL'
      when 'Breakdance'
        new_activity='BREAKDANCE'
    end
    new_activity
  end

  def convert_day(day)
    new_day = ''
    case day
      when 'LUNDI'
        new_day=0
      when 'MARDI'
        new_day=1
      when 'MERCREDI'
        new_day=2
      when 'JEUDI'
        new_day=3
      when 'VENDREDI'
        new_day=4
      when 'SAMEDI'
        new_day=5
      when 'DIMANCHE'
        new_day=6
    end
    new_day
  end
end
