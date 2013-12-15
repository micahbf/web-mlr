class MLR.Views.LoopView extends Backbone.View
  events:
    "click #start-1": "loopStart"
    "click #stop-1": "loopStop"

  loopStart: ->
    @model.loopStart()

  loopStop: ->
    @model.loopStop()