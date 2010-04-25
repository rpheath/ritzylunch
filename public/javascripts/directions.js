$(function() {
  
  if (GBrowserIsCompatible()) {
    var map = new GMap2(document.getElementById("map"))
    var point = new GLatLng(39.28106825818972, -80.34157991409302)
    map.setCenter(point, 15)
    map.setUIToDefault()

    var blueIcon = new GIcon(G_DEFAULT_ICON)
    blueIcon.image = "http://www.google.com/intl/en_us/mapfiles/ms/micons/blue-dot.png"
    
    directionsPanel = document.getElementById("directions")
    directions = new GDirections(map, directionsPanel)
    directions.load($('input#map_directions').val())
  }
  
});

$(window).unload(function() { GUnload() })