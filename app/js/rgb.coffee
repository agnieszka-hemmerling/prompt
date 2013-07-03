window.fg = '0'
window.bg = '2'
value = '2'
show_popup = ($button, e)->
    $table = $('.palette').first().clone()
    $('body').append($table)
    $table.die()
    $table.addClass($button.attr 'id')
    $table.css
     position: 'absolute'
     top: e.pageY
     left: e.pageX
    setTimeout ->
      $('body').click ->
        $table.fadeOut()
    100

    $(".palette div").bind 'click', ->
        color = $(this).css('background-color')
        if $(this).parents('table').hasClass 'set_fg'
            $('#prompt').css('color', color)
            window.fg = $(this).data('bashcolor')

        else if ($(this).parents('table').hasClass 'set_bg')
            $('#prompt').css('background-color', color)
            window.bg = $(this).data('bg')
        generate_prompt()

$prompt = $('#prompt').css

aClick = ->
  value = 1
  $('#prompt').css('font-weight':'bold')
  generate_prompt()

bClick = ->
  value = 4
  underline = '\\033[4m '

  $('#prompt').css('text-decoration':'underline')
  generate_prompt()

$ ->
  
  $('#set_fg').button().click (e)->
    show_popup($(this), e)

  $('#set_bg').button().click (e)->
    show_popup($(this), e)
  
  $('#set_bold').button().bind 'click',(a) ->
    aClick()
    $('#set_bold').click ->
      $(this).unbind 'click',(a)
      value = 2
      $('#prompt').css('font-weight':'normal')
      generate_prompt()

  $('#set_underline').button().bind 'click',(a) ->
    bClick()
    $('#set_underline').click ->
      $(this).unbind 'click',(a)
      value = 2
      $('#prompt').css('text-decoration':'none')
      generate_prompt()


generate_prompt = ->
  $('#box-content').html( "PS1='\\e[3#{window.fg};#{window.bg}m''\\033[#{value}m aga \\033[0m '" )
