# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# compiled file.
#
# Read Sprockets README (https:#github.com/sstephenson/sprockets#sprockets-directives) for details
# about supported directives.
#
#= require libs
#
#= require_tree ./pages
#= require_tree ./widgets
#= require_tree ./views


setupApplication = ->
  try
    viewClass = $('body').data('view-class')
    window.applicationView = eval("new #{viewClass}()")
  catch e
    console.debug("Dynamic loading of class #{viewClass} failed with following message: #{e}")
  finally
    window.applicationView = new Views.ApplicationView() unless window.applicationView
    window.applicationView.render()


$ ->
  $(document).on 'ready page:load', ->
    setupApplication()

  $(document).on 'ajax:complete', ->
    window.applicationView.ajaxComplete()

  $(document).on 'page:change', ->
    window.applicationView.pageChange()

 $(document).on 'page:before-change', ->
    window.applicationView.pageBeforeChange()

  $(document).on 'page:restore', ->
    window.applicationView.pageRestore()
    setupApplication()
