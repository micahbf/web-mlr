class MLR.Models.Loop extends Backbone.Model
  initialize: ->
    @audio_url = "/loops/#{@id}.wav"
