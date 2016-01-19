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
    @.$el.find("a[href=#{window.location.pathname.slice(1)}]").addClass 'active'

  render: ->
    @.$el.html @.template

module.exports = Header
