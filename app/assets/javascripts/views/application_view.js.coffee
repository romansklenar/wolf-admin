window.Views ||= {}
class Views.ApplicationView

  ajaxComplete: =>
    # insert here code which should be done when ajax:complete event is triggered
    # for instance code to stop ajax loading indicator

  pageChange: =>
    window.prevPageYOffset = window.pageYOffset
    window.prevPageXOffset = window.pageXOffset

  pageBeforeChange: =>
    @cleanup()

  pageRestore: =>
    @cleanup()

  # protected methods
  render: =>
    # enable bootstrap tooltips
    $('[data-toggle="tooltip"]').tooltip()

    # do not perform default action when button is clicked
    $('a[href=#]').on 'click', (event)->
      event.preventDefault()
      false

  cleanup: =>
    # insert here code which should set app to initial state or call plugins destructors
