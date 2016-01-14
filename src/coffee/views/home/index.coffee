Base = require '../base'
ScrollMagic = require 'scrollmagic'
TweenMax = require 'gsap'
require 'animation.gsap'

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

    Controller = new ScrollMagic.Controller
      globalSceneOptions:
        triggerHook: 'onLeave'

    $('.home__carousel__section').each (i, el)->

      Scene = new ScrollMagic.Scene
        triggerElement: @
        duration: 600
        triggerHook: 1

      Scene.setPin @

      if i != 0
        Ani = TweenMax.from $(this), 1,
          yPercent: 0
          xPercent: 100
        Scene.setTween Ani

      Controller.addScene Scene

  link: (event)->
    event.preventDefault()
    view = $(event.currentTarget).attr 'href'
    Base.GlobalEvents.trigger 'navigate', view

  render: ->
    @.$el.html @.template
    $('.base__header').empty()

module.exports = Home
