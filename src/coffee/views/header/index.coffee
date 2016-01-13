Base = require '../base'

Header = Backbone.View.extend
  el: '.base__header'

  template: require './index.hbs'

  additionalEvents: {}
  originalEvents:
    'click [data-next]': 'nextPage'

  events: ->
    return _.extend {}, @.originalEvents, @.additionalEvents

  initialize: ->
    @.render()

  render: ->
    @.$el.html @.template

module.exports = Header
