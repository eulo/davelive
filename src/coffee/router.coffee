AppRouter = Backbone.Router.extend
  routes:
    "" : "home"
    "industry-solutions" : "solutions"
    "about-us" : "about"

Router = new AppRouter
# The homepage
Router.on 'route:home', ->
  Home = require './views/home/index'
  Router.current = new Home
  $('html,body').scrollTop 0

Router.on 'route:solutions', ->
  View = require './views/industry-solutions/index'
  Router.current = new View
  $('html,body').scrollTop 0

Router.on 'route:about', ->
  View = require './views/about-us/index'
  Router.current = new View
  $('html,body').scrollTop 0
  
Backbone.history.start
  pushState: true

module.exports = Router
