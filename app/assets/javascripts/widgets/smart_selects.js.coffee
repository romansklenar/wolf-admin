window.Widgets ||= {}
class Widgets.SmartSelects
  @enable: ->
    $selects = $('[data-smart-select]')
    $.each $selects, (index, el) ->
      $select = $(el)

      # it has been already initialized
      if $select.parent().hasClass('fake-select-wrap')
        $select.siblings('.fake-select').html $select.find('option:selected').text()

      $wrapper = $('<div class="fake-select-wrap"></div>')
      $fake_select = $('<div class="fake-select"></div>')
      $select.wrap $wrapper
      $select.after $fake_select

      # set selected value as default
      $fake_select.html $select.find('option:selected').text()

      # change handler
      $select.change ->
        $fake_select.html $(this).find('option:selected').text()
      $select.focus(->
        $fake_select.addClass('focus')
      ).focusout(->
        $fake_select.removeClass('focus')
      )

  @cleanup: ->
    # do nothing
