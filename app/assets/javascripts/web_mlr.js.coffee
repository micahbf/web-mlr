window.MLR =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  audio: new MLR.Audio()
  initialize: ->
    MLR.audio.initializeContext()
    new MLR.Routers.AppRouter()
    Backbone.history.start()

$(document).ready ->
  MLR.initialize()
