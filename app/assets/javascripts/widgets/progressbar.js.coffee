window.Widgets ||= {}
class Widgets.Progressbar
  @enable: ->
    Turbolinks.enableProgressBar()

  @cleanup: ->
    # do nothing
