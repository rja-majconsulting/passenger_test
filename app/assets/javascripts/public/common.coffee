init_content = ->

  $('.bxslider').bxSlider({
    pager : false,
    controls : false,
    auto:true
  });

$(document).on('turbolinks:load', init_content)