Base = require '../base'
ScrollMagic = require 'scrollmagic'
TweenMax = require 'gsap'
require 'animation.gsap'
Videojs = require 'video.js'

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

    ## Header video

    videoHeight = $(window).width() / (1920/1080)
    $('#header-video').height videoHeight
    $(window).resize ->
      videoHeight = $(window).width() / (1920/1080)
      $('#header-video').height videoHeight 

    replay_video = ->
      @.headerVid.play()

    el = document.getElementById('header-video')
    @.headerVid = Videojs el, { loop: true }
    @.headerVid.ready ->
      @.on 'ended', replay_video
      @.play()

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
      duration: 2000

    Scene.setPin '.home__carousel'

    Ani = new TimelineMax()
    Ani.add TweenMax.to(".home__carousel--first", 0.5, {transform: "translateX(0%)"})
    Ani.add TweenMax.to(".home__carousel--second", 0.5, {transform: "translateX(101%)"})
    Ani.add TweenMax.to(".home__carousel--second", 1, {transform: "translateX(0)"})
    Ani.add TweenMax.to(".home__carousel--third", 0.5, {transform: "translateX(101%)"})
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

    @.$el.find('.parallax-window').each ->
      try $.fn.parallax.Constructor.destroy @
      catch e then log e

  render: ->
    @.$el.html @.template
    $('.base__header').empty()

module.exports = Home
