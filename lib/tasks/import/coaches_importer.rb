module CoachesImporter

  # import users
  def import_coaches
    puts "Importing coaches..."
    ActiveRecord::Base.establish_connection(@oldDb)
    coaches = ActiveRecord::Base.connection.execute("
      SELECT id_instructor, name, firstname, phone, email FROM ADM_instructor WHERE deleted='N'
      ")

    ActiveRecord::Base.establish_connection(:development)
    for i in 0...coaches.count do
      row = coaches.get_row i

      coach = Coach.new(id: row.get("id_instructor"),
                      lastName: row.get("name"),
                      firstName: row.get("firstname"),
                      telefonNumber: row.get("phone"),
                      email: row.get("email"))

      coach.save!
    end
  end
end
