Base = require '../base'

Footer = Backbone.View.extend
  el: '.base__footer'

  template: require './index.hbs'

  additionalEvents: {}
  originalEvents:
    'submit form': 'formSend'

  events: ->
    return _.extend {}, @.originalEvents, @.additionalEvents

  initialize: ->
    @.render()
    $('.parallax-window').parallax()

  formSend: (event)->
    $this = $(event.currentTarget)
    event.preventDefault()

    data = $this.serializeObject()
    # Do something with data

    $this.replaceWith "<h4 class='form-complete-message'>Thank you.<br> We'll be in touch soon.</h4>"

  render: ->
    @.$el.html @.template

module.exports = Footer
