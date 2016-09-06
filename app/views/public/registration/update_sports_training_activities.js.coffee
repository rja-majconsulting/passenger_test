$("#selectSportsTrainingMorningActivity").empty()
.append('<option value selected>Veuillez sélectionner une activité</option>')
.append("<option value>Aucune</option>")
.append("<%= escape_javascript(render(:partial => @morning_activities)) %>")

$("#selectSportsTrainingAfternoonActivity").empty()
.append('<option value selected>Veuillez sélectionner une activité</option>')
.append("<option value>Aucune</option>")
.append("<%= escape_javascript(render(:partial => @afternoon_activities)) %>")