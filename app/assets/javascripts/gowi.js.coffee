window.Gowi =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: ->
    new Gowi.Routers.Tasks()
    Backbone.history.start(pushState: true)

$(document).ready ->
  Gowi.init()
