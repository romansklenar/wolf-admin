window.Widgets ||= {}
class Widgets.SkinSwitcher
  @enable: ->
    $toggler = $('.skin-switcher .toggler')
    $menu    = $('.skin-switcher .menu')
    $sidebar = $('.main-sidebar')
    
    return if !$toggler.length

    if $.cookie('current_skin')
      $sidebar.attr 'id', $.cookie('current_skin')
      $menu.find('a').removeClass('active')
      $menu.find("a[data-skin=#{$.cookie('current_skin')}]").addClass('active')
      
    $toggler.click (e) ->
      e.stopPropagation()
      $menu.toggleClass('active')
      return

    $('body').click ->
      $menu.removeClass('active')
      return

    $menu.click (e) ->
      e.stopPropagation()
      return

    $menu.find('a').click (e) ->
      e.preventDefault()
      skin_id = $(this).data('skin')
      $menu.find('a').removeClass('active')
      $(this).addClass('active')
      $sidebar.attr('id', skin_id)
      $.removeCookie('current_skin', path: '/')
      $.cookie('current_skin', skin_id, path: '/')
      return

  @cleanup: ->
    # do nothing
