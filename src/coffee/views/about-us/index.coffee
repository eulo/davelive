Base = require '../base'

About = Backbone.View.extend
  el: '.base__content'

  header: require '../header/index'
  template: require './index.hbs'

  additionalEvents: {}
  originalEvents:
    'click [data-section]': 'sectionNav'

  events: ->
    return _.extend {}, @.originalEvents, @.additionalEvents

  initialize: ->
    new @.header
    @.render()

    $('.page__about__leftimage').parallax()

  render: ->
    @.$el.html @.template

module.exports = About
