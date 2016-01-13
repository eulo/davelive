Base = require '../base'

Home = Backbone.View.extend
  el: '.base__footer'

  template: require './index.hbs'

  additionalEvents: {}
  originalEvents:
    'click [data-next]': 'nextPage'

  events: ->
    return _.extend {}, @.originalEvents, @.additionalEvents

  initialize: ->
    @.render()
    $('.parallax-window').parallax()

  render: ->
    @.$el.html @.template

module.exports = Home
