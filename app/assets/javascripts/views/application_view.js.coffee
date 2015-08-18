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

  render: =>
    # enable app wide widgets
    Widgets.Sidebar.enable()
    Widgets.Progressbar.enable()
    Widgets.Analytics.enable()
    Widgets.SkinSwitcher.enable()
    Widgets.SmartSelects.enable()
    Widgets.TimeZoneDetect.enable()
    Widgets.Retina.enable() if window.devicePixelRatio >= 1.2
    
    # force re-render -- having an issue with that on Chrome/OSX
    if $('.fix-scroll').length > 0
      $('.fix-scroll').hide().show()
      window.scrollTo(window.prevPageXOffset, window.prevPageYOffset)
    
    # enable bootstrap tooltips
    $('[data-toggle="tooltip"]').tooltip()

    # do not perform default action when button is clicked
    $('a[href=#]').on 'click', (event)->
      event.preventDefault()
      return false

  cleanup: =>
    # insert here code which should set app to initial state or call plugins destructors
