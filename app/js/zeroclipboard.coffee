
$ ->
  ZeroClipboard.setMoviePath('zeroclipboard/ZeroClipboard10.swf')
  clip = new ZeroClipboard.Client() 
  clip.addEventListener "mousedown", ->
    clip.setText document.getElementById("box-content").value

  clip.addEventListener "complete", (client, text) ->
    alert "copied:" 

  clip.glue "copy"

