Base = require '../base'

Footer = Backbone.View.extend
  el: '.base__footer'

  template: require './index.hbs'

  additionalEvents: {}
  originalEvents:
    'submit form': 'formSend'
    'click .scroll-to-top': 'scrollTop'

  events: ->
    return _.extend {}, @.originalEvents, @.additionalEvents

  initialize: ->
    @.render()
    $('.parallax-window').parallax()

    $(window).scroll ->
     if ($(window).scrollTop() + $(window).height() > $(document).height() - 100)
       $('.scroll-to-top').addClass 'active'
     else
       $('.scroll-to-top').removeClass 'active'



  formSend: (event)->
    $this = $(event.currentTarget)
    event.preventDefault()

    data = $this.serializeObject()
    # Do something with data

    $this.replaceWith "<h4 class='form-complete-message'>Thank you.<br> We'll be in touch soon.</h4>"

  scrollTop: (event)->
    $(event.currentTarget).removeClass 'active'

    $('html, body').animate
      scrollTop: 0
    , 800

  render: ->
    @.$el.html @.template

module.exports = Footer
