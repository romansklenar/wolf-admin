aa_toggle_elements = ->
  $("input[data-on-change-toggle]").on 'change', (e) ->
    sel = $(this).data('on-change-toggle')
    $("#"+sel).toggle()

$(document).ready(aa_toggle_elements)
