window.MLR =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    new MLR.Routers.AppRouter()
    Backbone.history.start()

$(document).ready ->
  MLR.initialize()
