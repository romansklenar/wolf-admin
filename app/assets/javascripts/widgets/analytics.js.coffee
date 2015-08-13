# Google Analytics with Turbolinks support
window.Widgets ||= {}
class Widgets.Analytics
  @enable: ->
    if window.history?.pushState and window.history.replaceState
      document.addEventListener 'page:change', (event) ->
        if window._gaq != undefined
          _gaq.push(['_trackPageview'])
        else if window.pageTracker != undefined
          pageTracker._trackPageview()

  @cleanup: ->
    # do nothing
