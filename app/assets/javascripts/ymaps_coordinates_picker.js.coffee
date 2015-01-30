calculate_map_bounds = (markers) -> 
  return [[52.187405, 21.203613], [44.119142, 41.857910]] unless markers.length
  maxX = markers[0][0]
  maxY = markers[0][1]
  minX = markers[0][0]
  minY = markers[0][1]
  if markers.length == 1
    return [[minX - 0.005, minY - 0.005], [maxX + 0.005, maxY + 0.005]]
  for i in [1...markers.length]
    maxX = markers[i][0] if markers[i][0] > maxX
    minX = markers[i][0] if markers[i][0] < minX
    maxY = markers[i][1] if markers[i][1] > maxY
    minY = markers[i][1] if markers[i][1] < minY
  return [[minX, minY], [maxX, maxY]]

add_input = (marker) ->
  field = "<input type='hidden' name='#{latlng_field_name}' class='#{latlng_dom_class}' value='#{marker[0]} #{marker[1]}'>" 
  $('#ymapsFields').html($('#ymapsFields').html() + field)

reload_fields = ->
  $('#ymapsFields').html ''
  @map.geoObjects.each((geoObject)->
    add_input geoObject.geometry.getCoordinates()
  )

add_marker = (coordinates) -> 
  marker = new ymaps.Placemark(coordinates, {}, {})
  marker.events.add 'click', (e) ->
    @map.geoObjects.remove(e.get('target'))
    reload_fields()
  @map.geoObjects.add marker
  
@initialize_multi_map = ->
  mapElement = $('#yandex_picker_map')
  ymaps.ready(->
    @map = new ymaps.Map(
      mapElement[0],
      ymaps.util.bounds.getCenterAndZoom(
        calculate_map_bounds(markers),
        [mapElement.width(), mapElement.height()],
        false,
        {
          margin: 50
        }
      )
    )
    @map.behaviors.enable('scrollZoom')
    @map.events.add 'click', (e) ->
      add_marker(e.get('coords'))
      reload_fields()

    for i in [0...markers.length]
      add_marker(markers[i])
  )

@initialize_single_map = ->
  mapElement = $('#yandex_picker_map')
  ymaps.ready(->
    @map = new ymaps.Map(
      mapElement[0],
      ymaps.util.bounds.getCenterAndZoom(
        calculate_map_bounds(markers),
        [mapElement.width(), mapElement.height()],
        false,
        {
          margin: 100
        }
      )
    )
    @map.behaviors.enable('scrollZoom')
    @map.events.add 'click', (e) ->
      @map.geoObjects.remove(@marker)
      coordinates = e.get('coords')
      $('.' + lat_dom_class).val(coordinates[0])
      $('.' + lng_dom_class).val(coordinates[1])
      @marker = new ymaps.Placemark(coordinates, {}, {})
      @map.geoObjects.add @marker
    @marker = new ymaps.Placemark(markers[0], {}, {})
    @map.geoObjects.add @marker   
  )