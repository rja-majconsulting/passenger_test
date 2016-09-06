module SportDayImporter

  # import users
  def import_sport_day
    puts "Importing sport days..."
    ActiveRecord::Base.establish_connection(@oldDb)
    days = ActiveRecord::Base.connection.execute("
      SELECT id_day, code, date, place, price, beginHour, endHour, aptPlaceAM, aptPlacePM, paymentDeadline FROM ADM_day WHERE deleted='N'
      ")

    ActiveRecord::Base.establish_connection(:development)
    for i in 0...days.count do
      row = days.get_row i

      sport_day = SportsDay.new(id: row.get("id_day"),
                      code: row.get("code"),
                      place_id: row.get("place"),
                      date: row.get("date"),
                      price: row.get("price"),
                      startTime: row.get("beginHour"),
                      endTime: row.get("endHour"),
                      morningPlace: row.get("aptPlaceAM"),
                      afternoonPlace: row.get("aptPlacePM"),
                      paymentDate: row.get("paymentDeadline"))
      sport_day.save!
    end
  end
end
