window.Widgets ||= {}
class Widgets.Sidebar
  @enable: ->
    $sidebar_menu = $('.main-sidebar')

    # my account dropdown menu
    $account_menu = $sidebar_menu.find('.current-user .menu')
    $('.current-user .name').click (e) ->
      e.preventDefault()
      e.stopPropagation()
      $account_menu.toggleClass('active')
    $('body').click ->
      $account_menu.removeClass('active')

    # sidebar menu dropdown levels
    $dropdown_triggers = $sidebar_menu.find("[data-toggle~='sidebar']")
    $dropdown_triggers.click (e) ->
      e.preventDefault()
      if $sidebar_menu.width() >= 100
        # reset other dropdown menus
        if !$(this).closest('.submenu').length
          $dropdown_triggers.not(this).removeClass('toggled').siblings('.submenu').slideUp 300, check_height
        $trigger = $(this)
        $dropdown = $(this).siblings('.submenu')
        $trigger.toggleClass('toggled')
        if $trigger.hasClass('toggled')
          $dropdown.slideDown 300, check_height
        else
          $dropdown.slideUp 300, check_height

    # fix sidebar height depending on browser dimensions
    check_height = ->
      height = $('body').height()
      $sidebar_menu.css('bottom', 'auto')
      sidebar_height = $sidebar_menu.height()
      if height > sidebar_height
        $sidebar_menu.css('bottom', 0)
      else
        $sidebar_menu.css('bottom', 'auto')

    # mobile sidebar toggler
    $mobile_toggler = $('#content .sidebar-toggler')
    $mobile_toggler.click (e) ->
      e.stopPropagation()
      $('body').toggleClass('open-sidebar')
    $('#content').click ->
      $('body').removeClass('open-sidebar')

  @cleanup: ->
    # do nothing
