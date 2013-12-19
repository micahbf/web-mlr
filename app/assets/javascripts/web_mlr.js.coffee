window.MLR =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    @audio = new MLR.Audio
    MLR.audio.initializeContext()
    new MLR.Routers.AppRouter()
    Backbone.history.start()

$(document).ready ->
  MLR.initialize()
