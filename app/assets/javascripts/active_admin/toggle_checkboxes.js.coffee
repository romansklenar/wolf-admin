aa_toggle_checkboxes = ->
  # check all checkboxes by clicking to label
  $('fieldset.choices legend').on 'click', (e)->
    list = $(this).parents('fieldset').find('li.choice')
    checkboxes = list.find(':checkbox')
    checked_checkboxes = list.find(':checkbox:checked')

    should_check = checkboxes.length != checked_checkboxes.length
    checkboxes.prop('checked', should_check)

$(document).ready(aa_toggle_checkboxes)


