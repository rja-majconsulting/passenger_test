$("#selectSwimLessonPlace").empty()
.append('<option value selected>Veuillez sélectionner un lieu</option>')
.append("<%= escape_javascript(render(:partial => @swim_lesson_places)) %>")