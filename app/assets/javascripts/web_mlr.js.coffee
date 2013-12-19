window.MLR =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}

  settings:
    posBarUpdateInterval: 30
  
  initialize: ->
    @audio = new MLR.Audio
    MLR.audio.initializeContext()
    new MLR.Routers.AppRouter()
    Backbone.history.start()

$(document).ready ->
  MLR.initialize()
