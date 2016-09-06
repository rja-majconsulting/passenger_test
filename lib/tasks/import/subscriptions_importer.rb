module SubscriptionsImporter

  # import users
  def import_subscriptions
    puts "Importing subscriptions..."
    ActiveRecord::Base.establish_connection(@oldDb)
    subscriptions = ActiveRecord::Base.connection.execute("
      SELECT i.* FROM ADM_inscription i, ADM_stage s WHERE stage is not null AND stage=s.id_stage AND s.deleted='N' AND i.deleted='N'
      UNION ALL
      SELECT i.* FROM ADM_inscription i, ADM_lesson l WHERE swim is not null AND swim=id_lesson AND l.deleted='N' AND i.deleted='N'
      UNION ALL
      SELECT i.* FROM ADM_inscription i, ADM_module m WHERE module is not null AND module=id_module AND m.deleted='N' AND i.deleted='N'
      UNION ALL
      SELECT i.* FROM ADM_inscription i, ADM_day d WHERE day is not null AND day=id_day AND d.deleted='N' AND i.deleted='N'
      UNION ALL
      SELECT i.* FROM ADM_inscription i, ADM_place p, ADM_level l WHERE stage is null AND swim is null AND module is null AND day is null AND place is not null AND level is not null AND place=id_place AND p.deleted='N' AND level=id_level AND i.deleted='N'
      ")
    puts subscriptions.count

    ActiveRecord::Base.establish_connection(:development)
    for i in 0...subscriptions.count do
      row = subscriptions.get_row i

      if !!row.get("module") then
        type='SportModuleSubscription'
      end

      if !!row.get("stage") then
        type='SportsTrainingSubscription'
      end

      if !!row.get("day") then
        type='SportsDaySubscription'
      end

      if !!row.get("swim") or !!row.get("place") or !!row.get("level")
        type='SwimLessonSubscription'
      end

      subscription = Subscription.new(id: row.get("id_inscription"),
                               type: type,
                               lastName: row.get("name"),
                               firstName: row.get("firstname"),
                               birthDate: row.get("birthdate"),
                               street: row.get("street"),
                               city: row.get("city"),
                               postalCode: row.get("postalCode"),
                               telefonNumber: row.get("telefonNumber"),
                               email: row.get("email"),
                               comment: row.get("comment"),
                               paid: row.get("paid"),
                               sport_module_id: row.get("module"),
                               sports_training_id: row.get("stage"),
                               swim_lesson_id: row.get("swim"),
                               sports_day_id: row.get("day"),
                               place_id: row.get("place"),
                               level_id: row.get("level"),
                               activity_morning_id: row.get("actM"),
                               activity_afternoon_id: row.get("actA"),
                               dueDate: row.get("dueDate"))

      subscription.save!
    end
  end
end
