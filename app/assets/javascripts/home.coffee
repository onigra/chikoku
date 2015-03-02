options =
  enableHighAccuracy: true
  timeout: 5000
  maximumAge: 0

success = (pos) ->
  console.log pos.coords.latitude
  console.log pos.coords.longitude

error = (err) ->
  console.warn 'ERROR(' + err.code + '): ' + err.message

navigator.geolocation.getCurrentPosition success, error, options
