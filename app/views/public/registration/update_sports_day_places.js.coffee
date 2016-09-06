$("#selectSportsDayPlace").empty()
.append('<option value selected>Veuillez sélectionner un lieu</option>')
.append("<%= escape_javascript(render(:partial => @sports_day_places)) %>")