class MLR.Views.LoopView extends Backbone.View
  initialize: ->
    @listenTo(@model, "start", @startTracking)
    @listenTo(@model, "stop", @stopTracking)

  events:
    "click #start-1": "loopStart"
    "click #stop-1": "loopStop"

  loopStart: ->
    @model.loopStart()

  loopStop: ->
    @model.loopStop()

  startTracking: ->
    @trackingIntervalID = window.setInterval(@updatePosition.bind(this), MLR.settings.posBarUpdateInterval)

  stopTracking: ->
    window.clearInterval(@trackingIntervalID)

  updatePosition: ->
    posPct = (@model.relativePosition() * 100).toFixed(2)
    @$el.find("#position").css("width", "#{posPct}%")
