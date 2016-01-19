Base = require '../base'

Menu = Backbone.View.extend
  el: '.base__menu'

  template: require './index.hbs'

  additionalEvents: {}
  originalEvents:
    'click .menu__list a': 'closeMenu'

  events: ->
    return _.extend {}, @.originalEvents, @.additionalEvents

  initialize: ->
    @.render()
    @.$el.find("a[href='#{window.location.pathname.slice(1)}']").addClass 'active'

  closeMenu: (event)->
    $this = $(event.currentTarget)

    $('.menu__list a').removeClass 'active'
    $('.menu__container').removeClass 'active'
    $('.base__container').removeClass 'menu-open'

    $this.addClass 'active'
    return true

  render: ->
    @.$el.html @.template

module.exports = Menu
