class MLR.Models.Loop extends Backbone.Model
  initialize: ->
    @audio_url = "/loops/#{@id}.wav"
    @audio_buffer = null
    @context = MLR.audio.context
    @loadSound()

  loadSound: ->
    request = new XMLHttpRequest();
    request.open('GET', @audio_url, true)
    request.responseType = 'arraybuffer'

    request.onload = =>
      MLR.audio.context.decodeAudioData(request.response,
        ((buffer) =>
          @audio_buffer = buffer),
        -> (console.log("error loading audio buffer")))

    request.send()

  loopStart: ->
    @source = @context.createBufferSource()
    @source.buffer = @audio_buffer
    @source.connect @context.destination
    @source.start 0

  loopStop: ->
    @source.stop 0