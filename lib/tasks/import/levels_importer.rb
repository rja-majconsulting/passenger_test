module LevelsImporter

  # import levels
  def import_levels
    puts "Importing levels..."
    ActiveRecord::Base.establish_connection(@oldDb)
    levels = ActiveRecord::Base.connection.execute('
      SELECT id_level, name FROM ADM_level
      ')

    ActiveRecord::Base.establish_connection(:development)
    for i in 0...levels.count do
      row = levels.get_row i

      level = Level.new(id: row.get("id_level"),
                      name: row.get("name"))

      level.save!
    end
  end
end
