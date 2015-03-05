options =
  enableHighAccuracy: true
  timeout: 5000
  maximumAge: 0

success = (pos) ->
  $.ajax
    type: 'POST'
    url: 'send_message/check'
    data: { messenger: { lat: pos.coords.latitude, lng: pos.coords.longitude } }
    dataType: 'json'
    success: (data) ->
      if data["time_over"] == true
        if confirm("遅刻してるけど送る?") == true
          $.ajax
            type: 'GET'
            url: 'send_message/slack'
      else
        alert "まだ大丈夫"

error = (err) ->
  console.warn 'ERROR(' + err.code + '): ' + err.message

$ ->
  $('#check').click ->
    navigator.geolocation.getCurrentPosition success, error, options
