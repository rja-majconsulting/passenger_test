module ActivitiesImporter

  # import users
  def import_activities
    puts "Importing activities..."
    ActiveRecord::Base.establish_connection(@oldDb)
    activities = ActiveRecord::Base.connection.execute('
      SELECT id_activity, name, material, maxInscription FROM ADM_activity
      ')

    ActiveRecord::Base.establish_connection(:development)
    for i in 0...activities.count do
      row = activities.get_row i

      activity = Activity.new(id: row.get("id_activity"),
                      name: row.get("name"),
                      material: row.get("material"),
                      maxSubscriptions: row.get("maxInscription"))

      activity.save!
    end
  end
end
