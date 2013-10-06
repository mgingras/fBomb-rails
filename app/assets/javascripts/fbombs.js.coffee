# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  mapOptions =
    zoom: 3
    center: new google.maps.LatLng(30.297018, 0.851440)
    mapTypeId: google.maps.MapTypeId.ROADMAP,
    disableDefaultUI: true,
    disableDoubleClickZoom: true,
    scrollwheel: false
  map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions)
  
$.get "tweets", (data) ->
  alert "Load was performed." + data
  
  # $.get( "tweets", function( data ) {
  #   alert( "Load was performed." + data);
  # });