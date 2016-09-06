$("#sports_training_subscription_activity_morning_id").empty()
    .append("<%= escape_javascript(render(:partial => @morning_activities)) %>")

$("#sports_training_subscription_activity_afternoon_id").empty()
    .append("<%= escape_javascript(render(:partial => @afternoon_activities)) %>")

$('.select').selectpicker('refresh')