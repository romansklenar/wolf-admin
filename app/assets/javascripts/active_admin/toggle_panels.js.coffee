aa_toggle_panels = ->
  # add collapsing feature to panels
  $('.panel h3').append($('<span>&#x25bc;</span>')).click (e)->
    panel = $(e.target).next('.panel_contents')
    arrow = if panel.css('display') == 'block' then '&#x25ba;' else '&#x25bc;'
    $(this).find('span').html(arrow)
    panel.slideToggle("fast")
    return false
  $('.panel[collapsed=true] h3').click()

$(document).ready(aa_toggle_panels)
