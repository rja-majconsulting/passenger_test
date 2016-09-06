# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


init_form = ->
  nowDate = new Date()
  today = new Date(nowDate.getFullYear(), nowDate.getMonth(), nowDate.getDate(), 0, 0, 0, 0)

  $('.date').datepicker({
    format: 'dd-mm-yyyy',
    autoclose:true,
    startDate:today,
    language:'fr'
  });

  $('.select').selectpicker();


$(document).on('turbolinks:load', init_form)