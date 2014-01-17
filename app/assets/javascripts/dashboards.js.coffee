$ ->
  $('.next_page').on 'inview', (e, visible) ->
    return unless visible
    $.getScript $(this).attr('href')
	