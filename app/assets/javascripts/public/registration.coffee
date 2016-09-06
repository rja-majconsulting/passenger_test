
$ ->
  $(document).on 'turbolinks:load', () ->
    $.validate({
      ignore: ':hidden'
    })
  $(document).on 'change', '#selectSubscriptionType', (evt) ->
    $('.dynamicForm').hide()
    type = this.value
    switch type
      when 'SwimLessonSubscription' then init_swim_lesson_subscription()
      when 'BirthDaySubscription' then init_birthday_subscription()
      when 'SportsTrainingSubscription' then init_sports_training_subscription()
      when 'AdultSwimLessonSubscription' then init_adult_swim_lesson_subscription()
      when 'SportModuleSubscription' then init_sport_module_subscription()
      when 'SportsDaySubscription' then init_sports_day_subscription()


  $(document).on 'change', '#selectSportsTrainingPlace', (evt) -> update_sports_training_choices(this.value)

  $(document).on 'change', '#selectSwimLessonPlace', (evt) -> update_swim_lesson_levels(this.value)

  $(document).on 'change', '#selectSportsTrainingChoice', (evt) -> update_sports_training_activities(this.value)

  $(document).on 'change', '#selectSwimLessonLevel', (evt) -> update_swim_lesson_choices(this.value, $('#selectSwimLessonPlace').val())

  $(document).on 'change', '#selectSportModulePlace', (evt) -> update_sport_module_choices(this.value)

  $(document).on 'change', '#selectSportsDayPlace', (evt) -> update_sports_day_choices(this.value)


  init_swim_lesson_subscription = -> update_swim_lesson_places()

  init_birthday_subscription = ->
    $('#birthday_place').show()
    $('#birthday_type').show()

  init_sports_training_subscription = -> update_sports_training_places()

  init_adult_swim_lesson_subscription = ->
    $('#adult_swim_lesson_place').show()

  init_sport_module_subscription = -> update_sport_module_places()

  init_sports_day_subscription = -> update_sports_day_places()

  update_sports_training_places = ->
    promise = $.ajax('/public/registration/update_sports_training_places')
    promise.then (returnedData) -> $('#sports_training_place').show()

  update_swim_lesson_places = ->
    promise = $.ajax('/public/registration/update_swim_lesson_places')
    promise.then (returnedData) -> $('#swim_lesson_place').show()

  update_swim_lesson_levels = (place_id) ->
    $('#swim_lesson_day').hide()
    if !!place_id
      promise = $.ajax('/public/registration/update_swim_lesson_levels', data: {place_id : place_id})
      promise.then (returnedData) -> $('#swim_lesson_level').show()
    else
      $('#swim_lesson_level').hide()

  update_swim_lesson_choices = (level_id, place_id) ->
    if !!place_id and !!level_id
      promise = $.ajax('/public/registration/update_swim_lesson_choices', data: {place_id : place_id, level_id : level_id})
      promise.then (returnedData) -> $('#swim_lesson_day').show()
    else
      $('#swim_lesson_day').hide()

  update_sport_module_choices = (place_id) ->
    if !!place_id
      promise = $.ajax('/public/registration/update_sport_module_choices', data: {place_id : place_id})
      promise.then (returnedData) -> $('#sport_module_activity').show()
    else
      $('#sport_module_activity').hide()

  update_sports_day_choices = (place_id) ->
    if !!place_id
      promise = $.ajax('/public/registration/update_sports_day_choices', data: {place_id : place_id})
      promise.then (returnedData) -> $('#sports_day_date').show()
    else
      $('#sports_day_date').hide()

  update_sport_module_places = ->
    promise = $.ajax('/public/registration/update_sport_module_places')
    promise.then (returnedData) -> $('#sport_module_place').show()

  update_sports_day_places = ->
    promise = $.ajax('/public/registration/update_sports_day_places')
    promise.then (returnedData) -> $('#sports_day_place').show()


  update_sports_training_choices = (place_id) ->
    $('#sports_training_morning_activity').hide()
    $('#sports_training_afternoon_activity').hide()
    if !!place_id
      promise = $.ajax('/public/registration/update_sports_training_choices', data: {place_id : place_id})
      promise.then (returnedData) -> $('#sports_training_choice').show()
    else
      $('#sports_training_choice').hide()

  update_sports_training_activities = (sports_training_id) ->
    if !!sports_training_id
      promise = $.ajax('/public/registration/update_sports_training_activities', data: {sports_training_id : sports_training_id})
      promise.then (returnedData) ->
        $('#sports_training_morning_activity').show()
        $('#sports_training_afternoon_activity').show()
    else
      $('#sports_training_morning_activity').hide()
      $('#sports_training_afternoon_activity').hide()




