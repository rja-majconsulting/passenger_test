$("#selectSportsTrainingChoice").empty()
.append('<option value selected>Veuillez sélectionner une période</option>')
.append("<%= escape_javascript(render(:partial => @sports_trainings)) %>")