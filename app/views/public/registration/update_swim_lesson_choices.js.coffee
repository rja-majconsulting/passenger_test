$("#selectSwimLessonDay").empty()
.append('<option value selected>Veuillez sélectionner un horaire</option>')
.append('<option value>Autres disponibilités</option>')
.append("<%= escape_javascript(render(:partial => @swim_lessons)) %>")