module PlacesImporter

  # import users
  def import_places
    puts "Importing places..."
    ActiveRecord::Base.establish_connection(@oldDb)
    places = ActiveRecord::Base.connection.execute("
      SELECT id_place, alias, street, postalCode, city FROM ADM_place WHERE deleted='N'
      ")

    ActiveRecord::Base.establish_connection(:development)
    for i in 0...places.count do
      row = places.get_row i

      place = Place.new(id: row.get("id_place"),
                      alias: row.get("alias"),
                      street: row.get("street"),
                      city: row.get("city"),
                      postalCode: row.get("postalCode"))

      place.save!
    end
  end
end
