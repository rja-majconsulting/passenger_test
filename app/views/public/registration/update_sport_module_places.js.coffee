$("#selectSportModulePlace").empty()
.append('<option value selected>Veuillez sélectionner un lieu</option>')
.append("<%= escape_javascript(render(:partial => @sport_module_places)) %>")