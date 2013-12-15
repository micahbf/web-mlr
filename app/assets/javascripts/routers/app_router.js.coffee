class MLR.Routers.AppRouter extends Backbone.Router
  routes:
    '': 'root'

  root: ->
    el = $("#loop1").get(0)
    console.log el
    model = new MLR.Models.Loop id: 1
    view = new MLR.Views.LoopView(
      el: el
      model: model
      )