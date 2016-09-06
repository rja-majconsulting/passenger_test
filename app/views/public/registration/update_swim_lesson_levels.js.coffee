$("#selectSwimLessonLevel").empty()
.append('<option value selected>Veuillez sélectionner un niveau</option>')
.append("<%= escape_javascript(render(:partial => @swim_lesson_levels)) %>")