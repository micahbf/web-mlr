class MLR.Models.Loop extends Backbone.Model
  initialize: ->
    @audio_url = "/loops/#{@id}.wav"
    @audio_buffer = null
    @loadSound()

  loadSound: ->
    request = new XMLHttpRequest();
    request.open('GET', @audio_url, true)
    request.responseType = 'arraybuffer'

    request.onload = =>
      MLR.audio.context.decodeAudioData(request.response,
        ((buffer) =>
          @audio_buffer = buffer
          console.log("buffer loaded")),
        onError)

    request.send()


  loopStart: ->
    MLR.audio.playSound(@audio_buffer)