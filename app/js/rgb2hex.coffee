rgb2hex = (rgb) ->
  hex = (x) ->
    (if isNaN(x) then "00" else hexDigits[(x - x % 16) / 16] + hexDigits[x % 16])
  hexDigits = [ "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f" ]
  rgb = rgb.match(/^rgb\((\d+),\s*(\d+),\s*(\d+)\)$/)
  "#" + hex(rgb[1]) + hex(rgb[2]) + hex(rgb[3])
