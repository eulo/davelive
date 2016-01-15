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

    if $(window).width() >= 768
      @.initAnimation()

  initAnimation: ->
    @.Controller = new ScrollMagic.Controller
      globalSceneOptions:
        triggerHook: 'onLeave'

    Scene = new ScrollMagic.Scene
      triggerElement: '.home__carousel'
      duration: 1000

    Scene.setPin '.home__carousel'

    Ani = new TimelineMax()
    Ani.add TweenMax.to(".home__carousel--second", 1, {transform: "translateX(0)"})
    Ani.add TweenMax.to(".home__carousel--third", 1, {transform: "translateX(0)"})

    Scene.setTween Ani

    @.Controller.addScene Scene

  link: (event)->
    event.preventDefault()
    view = $(event.currentTarget).attr 'href'
    Base.GlobalEvents.trigger 'navigate', view

  destroy: ->
    if @.Controller
      @.Controller.destroy()

  render: ->
    @.$el.html @.template
    $('.base__header').empty()

module.exports = Home
