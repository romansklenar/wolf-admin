window.Widgets ||= {}
class Widgets.Retina
  @enable: ->
    $('[data-2x]').each ->
      if @tagName == 'IMG'
        $(this).attr 'src', $(this).attr('data-2x')
      else
        $(this).css 'background-image': "url(#{$(this).attr('data-2x')})"

  @cleanup: ->
    # do nothing
