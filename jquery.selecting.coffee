# jquery.selecting.coffee
# selecting -- a jquery plugin for chained selecting, coded by CoffeeScript
#
# Usage:
#   $('selector').selecting({
#     remote: {
#       url: 'json_array_url',
#       data: {}
#     }
#   });
#
# style guide:
# http://coffeescriptcookbook.com/chapters/jquery/plugin
# http://learn.jquery.com/plugins/
#
# gurdy.woo@mail.ustc.edu.cn
# last modified by wulx, 2013/09/02

# reference jQuery
$ = jQuery
# adds plugin object to jQuery
$.fn.extend
  # authoring
  selecting: (options) ->
    # merge default settings with options
    settings = $.extend
      # default settings
      debug: false
      bare: true
    , options
    # debuging logger
    log = (msg...) ->
      console?.log msg... if settings.debug and msg
    # each magic code
    return @each ->
      $$ = $(@)
      if (remote = settings.remote)?
        $.getJSON(remote.url, remote.data)
        .done (json_array) ->
          if not settings.bare
            $$.append ("<select name='#{sel[0]}'><option>#{sel[1]}</option></select>" for sel in json_array[0][1..]).join('')

          $$.find("select[name=#{json_array[0][1][0]}]")
            .append ("<option value='#{opt[0][0]}'>#{opt[0][1]}</option>" for opt in json_array[1..]).join('')

          $$.find("select").change (evt) ->
            $el = $(evt.currentTarget)
            $el.nextAll('select').find('option[value]').remove()

            ja = null
            $($el.next().prevAll('select').get().reverse()).each ->
              i = $(@).find('option:selected').index()
              if i > 0
                ja = if ja then ja[i] else json_array[i]
                #log ja

            if ja
              $el.nextAll('select').first()
                .append ("<option value='#{opt[0][0]}'>#{opt[0][1]}</option>" for opt in ja[1..]).join('')
