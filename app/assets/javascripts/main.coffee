$(document).on "turbolinks:load", ->
  $(window).scroll ->
    if ($(this).scrollTop() > 50) 
      $('#back-to-top').fadeIn()
    else
      $('#back-to-top').fadeOut()

  $('#back-to-top').click ->
    $('#back-to-top').tooltip('hide')
    $('html, body').animate({scrollTop: 0}, '800')
    false
