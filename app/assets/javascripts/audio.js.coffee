class MLR.Audio
  @context = null

  initializeContext: =>
    try
      window.AudioContext = window.AudioContext || window.webkitAudioContext
      @context = new AudioContext()
    catch e
      alert('Web Audio API not supported')

  playSound: (buffer) =>
    source = @context.createBufferSource()
    source.buffer = buffer
    source.connect @context.destination
    source.start 0