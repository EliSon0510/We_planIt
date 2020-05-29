import mapboxgl from 'mapbox-gl';

const initMapbox = () => {

  const mapElement = document.getElementById('map');

  const buildMap = () => {
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    return new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10'
    });
  };

  const addMarkersToMap = (map, markers) => {
    markers.forEach((marker) => {
      console.log(marker)
      const popup = new mapboxgl.Popup().setHTML(marker.infoWindow); // add this

      new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(map);
    });
  };

  const fitMapToMarkers = (map, markers) => {
  if (markers.length === 0) { return }
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach((marker) => {
  console.log(marker)
  bounds.extend([ marker.lng, marker.lat ])});
  map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
  };

  if (mapElement) { // only build a map if there's a div#map to inject into
    const map = buildMap();
    const markers = JSON.parse(mapElement.dataset.markers);
    addMarkersToMap(map, markers);
    fitMapToMarkers(map, markers);
}};

export { initMapbox };
