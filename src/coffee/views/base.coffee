Handlebars = require 'hbsfy/runtime'

BaseView = Backbone.View.extend
  el: '#main'

  template: require './base.hbs'

  menu: require './menu/index'
  footer: require './footer/index'

  initialize: ->
    @.render()
    new @.footer
    new @.menu

  events:
    'click a[href]': 'link'
    'click [data-scroll]': 'scrollTo'
    'click .mobile-menu-toggle': 'mobileMenu'

  link: (event)->
    event.preventDefault()
    view = $(event.currentTarget).attr 'href'
    if view == '#'
      return
    @.GlobalEvents.trigger 'navigate', view

  scrollTo: (event) ->
    event.preventDefault()
    $this = $(event.currentTarget)

    _id = $this.data 'scroll'
    speed = $this.data 'speed'

    $('html, body').animate
      scrollTop: $(_id).position().top
    , speed || 800

  mobileMenu: (event) ->
    $this = $(event.currentTarget)
    $('.menu__container').toggleClass 'active'
    $('.base__container').toggleClass 'menu-open'

  render: ->
    @.$el.html @.template

module.exports = new BaseView
