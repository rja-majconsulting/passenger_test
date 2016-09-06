$("#selectSportsDayDate").empty()
.append('<option value selected>Veuillez sélectionner une date</option>')
.append("<%= escape_javascript(render(:partial => @sports_days)) %>")