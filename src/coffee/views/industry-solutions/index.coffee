Base = require '../base'

Solutions = Backbone.View.extend
  el: '.base__content'

  header: require '../header/index'
  template: require './index.hbs'
  sections: ['retailers', 'manufactuers', 'events']

  additionalEvents: {}
  originalEvents:
    'click [data-section]': 'sectionNav'

  events: ->
    return _.extend {}, @.originalEvents, @.additionalEvents

  initialize: ->
    new @.header
    @.render()

    $('.parallax-window').parallax()
    # init section
    hash = window.location.hash
    hash = hash.slice 1
    if _.contains @.sections, hash
      $("[data-section='#{hash}']").addClass 'active'
      $(".page__section--#{hash}").addClass 'active'
    else
      $("[data-section]").first().addClass 'active'
      $(".page__section").first().addClass 'active'
      window.location.hash = $("[data-section]").first().data 'section'

  sectionNav: (event) ->
    $this = $(event.currentTarget)
    section = $this.data 'section'

    $('.page__section').removeClass 'active'
    $(".page__section--#{section}").addClass 'active'

    $('[data-section]').removeClass 'active'
    $this.addClass 'active'

    window.location.hash = section

  destroy: ->
    # Nothing

  render: ->
    @.$el.html @.template

module.exports = Solutions
