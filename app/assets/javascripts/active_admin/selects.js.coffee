#= require selectize

aa_selectize = ->
  # apply selectize to selectboxes
  $('select').each ->
    $(this).selectize()

  $(document).on 'has_many_add:after', '.has_many_container', (e, fieldset)->
    fieldset.find($('select')).each ->
      $(this).selectize()


$(document).ready(aa_selectize)
