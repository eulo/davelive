Handlebars = require 'hbsfy/runtime'

BaseView = Backbone.View.extend
  el: '#main'

  template: require './base.hbs'

  footer: require './footer/index'

  initialize: ->
    @.render()
    new @.footer

  events:
    'click a[href]': 'link'
    'click [data-scroll]': 'scrollTo'

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

  render: ->
    @.$el.html @.template

module.exports = new BaseView
