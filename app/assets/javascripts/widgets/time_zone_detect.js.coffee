window.Widgets ||= {}
class Widgets.TimeZoneDetect
  @enable: ->
  time_zone = jstz.determine()
  $.cookie 'browser.time_zone', time_zone.name(), { expires: 365, path: '/' }

  @cleanup: ->
    # do nothing
