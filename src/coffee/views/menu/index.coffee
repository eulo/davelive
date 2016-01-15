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

  closeMenu: ->
    $('.menu__container').removeClass 'active'
    $('.base__container').removeClass 'menu-open'

  render: ->
    @.$el.html @.template

module.exports = Menu
