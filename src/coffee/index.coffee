# libs
window.jQuery = window.$ = require 'jquery'
window._ = require 'underscore'
require 'bootstrap'
window.Backbone = require 'backbone'
Backbone.$ = jQuery

window.log = ->
  console.log.apply console, arguments

require 'parallax.js'
require './lib/jquery.serializeObject'

Base = require './views/base'
Base.GlobalEvents = _.extend {}, Backbone.Events

Router = require './router'
Router.listenTo Base.GlobalEvents, 'navigate', (route) ->
  Router.current.destroy()
  @navigate route,
    trigger: true
    replace: true
