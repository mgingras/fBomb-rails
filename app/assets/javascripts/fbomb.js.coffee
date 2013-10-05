# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  mapOptions =
    zoom: 3
    center: new google.maps.LatLng(30.297018, 0.851440)
    mapTypeId: google.maps.MapTypeId.ROADMAP,
    # streetViewControl: false
    disableDefaultUI: true,
    disableDoubleClickZoom: true,
    scrollwheel: false

  map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions)
  
# $(document).ready(function() {
#   mapOptions = {
#     zoom: 8,
#     center: new google.maps.LatLng(-34.397, 150.644),
#     mapTypeId: google.maps.MapTypeId.ROADMAP
#   }
#   map = new google.maps.Map(document.getElementById(""), mapOptions);
# }
# 
# $(document).ready(() -> mapOptions )