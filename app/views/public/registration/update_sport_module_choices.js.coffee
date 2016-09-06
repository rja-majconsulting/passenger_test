$("#selectSportModuleActivity").empty()
.append('<option value selected>Veuillez sélectionner une activité</option>')
.append("<%= escape_javascript(render(:partial => @sport_modules)) %>")