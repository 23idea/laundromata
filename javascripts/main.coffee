require.config
  paths:
    jquery: "../components/jquery/jquery"
    leaflet: "../components/leaflet/dist/leaflet"
    bootstrap: "../components/bootstrap/js/bootstrap-modal"
    simpleModel: "../components/simplemodal/jquery.simplemodal.1.4.4.min"
  shim:
    jquery:
      exports: 'jQuery'
    bootstrap: ['jquery']
    leaflet:
      exports: 'L'

require ["jquery", "simpleModel" , "leaflet"], ($) ->
  $(document).ready (e)->
    map = L.map('map',
      maxZoom: 6
      minZoom: 2
      zoomControl: false
    ).setView([36.126783, -115.136719], 4)

    
    map.attributionControl.addAttribution("<a href='http://www.mapbox.com'>Mapbox</a>")
    L.tileLayer('http://{s}.tiles.mapbox.com/v3/mjbecze.test2/{z}/{x}/{y}.png').addTo(map)

    sample_text = "<div><h2>Chicago</h2>"+
    "<address>162 5th Avenue, 6th Floor<br>New York, NY 10010<br>"+
    "<a href='mailto:chicago@laundromata.com'>chicago@laundromata.com</a><br>"

    austin_text = "<h2>Austin</h2>"+
    "<a href='mailto:austin@laundromata.com'>austin@laundromata.com</a><br>"
    chicago_text = "<h2>Chicago</h2>"+
    "<a href='mailto:chicago@laundromata.com'>chicago@laundromata.com</a><br>"
    dubai_text = "<h2>Dubai</h2>"+
    "<a href='mailto:dubia@laundromata.com'>dubia@laundromata.com</a><br>"
    dublin_text = "<h2>Dublin</h2>"+
    "<a href='mailto:dublin@laundromata.com'>dublin@laundromata.com</a><br>"
    firenze_text = "<h2>Firenze</h2>"+
    "<a href='mailto:firenze@laundromata.com'>firenze@laundromata.com</a><br>"
    las_vegas_text = "<h2>Las Vegas</h2>"+
    "<a href='mailto:lasvegas@laundromata.com'>lasvegas@laundromata.com</a><br>"
    london_text = "<h2>London</h2>"+
    "<a href='mailto:london@laundromata.com'>london@laundromata.com</a><br>"
    los_angeles_text = "<h2>Los Angeles</h2>"+
    "<a href='mailto:losangels@laundromata.com'>losangeles@laundromata.com</a><br>"
    new_york_text = "<h2>New York</h2>"+
    "<a href='mailto:newyork@laundromata.com'>newyork@laundromata.com</a><br>"
    tokyo_text = "<h2>Tokyo</h2>"+
    "<a href='mailto:tokyo@laundromata.com'>tokyo@laundromata.com</a><br>"
    seattle_text = "<h2>Seattle</h2>"+
    "<a href='mailto:seattle@laundromata.com'>seattle@laundromata.com</a><br>"


    customIcon = L.icon({
      iconUrl: '/laundromata/images/pin.png'
      iconSize: [35, 90]
      popupAnchor: [0, -38]
    })

    #add markers to map
    austin = L.marker([30.244832, -97.738495], {icon: customIcon})
      .bindPopup(austin_text)
      .addTo(map)
 
    chicago = L.marker([41.873651, -87.624207], {icon: customIcon})
      .bindPopup(chicago_text)
      .addTo(map)
    dubai = L.marker([25.264568, 55.307922], {icon: customIcon})
      .bindPopup(dubai_text)
      .addTo(map)
    dublin = L.marker([53.348912, -6.237488], {icon: customIcon})
      .addTo(map)
      .bindPopup(dublin_text)
    firenze = L.marker([43.772333, 11.254463], {icon: customIcon})
      .addTo(map)
      .bindPopup(firenze_text)
    las_vegas = L.marker([36.126783, -115.136719], {icon: customIcon})
      .addTo(map)
      .bindPopup(las_vegas_text)
    london = L.marker([51.509597, -0.109863], {icon: customIcon})
      .addTo(map)
      .bindPopup(london_text)
    los_angeles = L.marker([34.023071, -118.226624], {icon: customIcon})
      .addTo(map)
      .bindPopup(los_angeles_text)
    new_york = L.marker([40.700422, -73.998413], {icon: customIcon})
      .addTo(map)
      .bindPopup(new_york_text)
    tokyo = L.marker([35.689649, 139.76738], {icon: customIcon})
      .addTo(map)
      .bindPopup(tokyo_text)
    seattle = L.marker([47.605237, -122.323837], {icon: customIcon})
      .addTo(map)
      .bindPopup(seattle_text)

    overlayWidth = 393
    $("#addresses h2").on "click", ()->
      $(".open").animate({
        padding: '0px'
        "font-size": '23.5px'
      }).removeClass("open")

      $(this).animate({
        padding: '4px 0px 4px 11px'
        "font-size": '26px'
      }).addClass("open")
      
      if this.id isnt "internets"
        marker = eval(this.id)
        targetPoint = map.project(marker.getLatLng(), map.getZoom()).subtract([overlayWidth / 2, 0])
        targetLatLng = map.unproject(targetPoint, map.getZoom())
        map.panTo(targetLatLng)
        marker.openPopup()
      else
        $('html, body').animate({
              scrollTop: $("#bottom").offset().top
        }, 2000)
