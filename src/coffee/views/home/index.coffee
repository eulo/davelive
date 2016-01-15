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

    ## Computer

    @.Computer = new ScrollMagic.Controller
      globalSceneOptions:
        triggerHook: 'onEnter'

    Scene = new ScrollMagic.Scene
      triggerElement: '.home__section--second'
      duration: 1000
      triggerHook: 'onEnter'

    #Scene.setPin '.home__section--second'

    Ani = TweenMax.from '.home__section__computer', 1,
      xPercent: -100

    Scene.setTween Ani

    @.Computer.addScene Scene

    ## Carousel

    @.Carousel = new ScrollMagic.Controller
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

    @.Carousel.addScene Scene

  link: (event)->
    event.preventDefault()
    view = $(event.currentTarget).attr 'href'
    Base.GlobalEvents.trigger 'navigate', view

  destroy: ->
    if @.Carousel
      @.Carousel.destroy()
    if @.Computer
      @.Computer.destroy()

  render: ->
    @.$el.html @.template
    $('.base__header').empty()

module.exports = Home
