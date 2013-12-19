class MLR.Models.Loop extends Backbone.Model
  initialize: ->
    @audio_url = "/loops/#{@id}.wav"
    @audio_buffer = null
    @context = MLR.audio.context
    @loadSound()
    @duration = null
    @startTime = null
    @playing = false

  loadSound: ->
    request = new XMLHttpRequest();
    request.open('GET', @audio_url, true)
    request.responseType = 'arraybuffer'

    request.onload = =>
      MLR.audio.context.decodeAudioData(request.response,
        ((buffer) =>
          @audio_buffer = buffer
          @duration = buffer.duration),
        -> (console.log("error loading audio buffer")))

    request.send()

  loopStart: ->
    @_startPlaying(0)

  loopStop: ->
    @_stopPlaying()

  position: ->
    return null unless @playing
    (@context.currentTime - @startTime) % @duration

  relativePosition: ->
    @position() / @duration

  _initializeSource: ->
    @source = @context.createBufferSource()
    @source.buffer = @audio_buffer
    @source.connect @context.destination
    @source.loop = true

  _startPlaying: (position) ->
    @_initializeSource()
    @source.start position
    @startTime = @context.currentTime
    @playing = true
    @trigger("start")

  _stopPlaying: ->
    @source.stop 0
    @playing = false
    @startTime = null
    @trigger("stop")


