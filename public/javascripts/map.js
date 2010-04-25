$(function() {
  
  if (GBrowserIsCompatible()) {
    var map = new GMap2(document.getElementById("map"))
    var point = new GLatLng(39.28106825818972, -80.34157991409302)
    map.setCenter(point, 15)
    map.setUIToDefault()

    var blueIcon = new GIcon(G_DEFAULT_ICON)
    blueIcon.image = "http://www.google.com/intl/en_us/mapfiles/ms/micons/blue-dot.png"
    
    map.addOverlay(new GMarker(point))
    map.openInfoWindow(
      point,
      "<h4>The Ritzy Lunch</h4>" +
      "<p>456 West Pike Street<br />Clarksburg, WV 26301-2712<br />(304) 622-3600"
    )
  }
  
});

$(window).unload(function() { GUnload() })