# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

init = ->
  init_form()
  init_search()

init_form = ->

  $('.birthDate').datepicker({
    format: 'dd-mm-yyyy',
    autoclose:true,
    startView: 1,
    language:'fr'
  });


init_search = ->
  $(document).on 'keyup', '.search', (evt) ->
    val = this.value.toLowerCase()
    $('.panel').show().filter((i,elem) ->
      nameText = $(this).find('.name').text().toLowerCase()
      firstNameText = $(this).find('.firstname').text().toLowerCase()
      nameText.indexOf(val) < 0 and firstNameText.indexOf(val) < 0).hide()

    $('.subscription').show().filter((i,elem) ->
      nameText = $(this).find('.name').text().toLowerCase()
      firstNameText = $(this).find('.firstname').text().toLowerCase()
      nameText.indexOf(val) < 0 and firstNameText.indexOf(val) < 0).hide()

    if !!val
      $('.panel-collapse').not('.in').collapse('toggle')

    else
      $('.panel-collapse.in').collapse('toggle')

$(document).on('turbolinks:load', init)

$(document).on 'change', '#sports_training_subscription_sports_training_id', (evt) -> update_activities(this.value)

update_activities = (sports_training_id) -> $.ajax('/admin/subscription/update_activities', data: {sports_training_id : sports_training_id})