Base = require '../base'

Home = Backbone.View.extend
  el: '.base__content'

  template: require './index.hbs'

  additionalEvents: {}
  originalEvents:
    'click [data-link]': 'link'

  events: ->
    return _.extend {}, @.originalEvents, @.additionalEvents

  initialize: ->
    @.render()
    $('.parallax-window').parallax()

    ###
    $('.home__carousel').pagepiling
      direction: 'horizontal'
      sectionSelector: '.home__carousel__section'
    Controller = new ScrollMagic.Controller()
    Scene = new ScrollMagic.Scene
      offset: $('.home__carousel').position().top
      duration: 500
    Scene.setPin '.home__carousel'
    Scene.addTo Controller
    ###

  link: (event)->
    event.preventDefault()
    view = $(event.currentTarget).attr 'href'
    Base.GlobalEvents.trigger 'navigate', view

  render: ->
    @.$el.html @.template
    $('.base__header').empty()

module.exports = Home
