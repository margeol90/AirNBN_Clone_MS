import { Controller } from "@hotwired/stimulus";
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder";

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array,
  };

  connect() {
    mapboxgl.accessToken = this.apiKeyValue;
    this.map = new mapboxgl.Map({
      container: this.element, // container ID (our data-controler div in index.html.erb file)
      style: "mapbox://styles/mapbox/streets-v12", // style URL
      // center: [-74.5, 40], // starting position [lng, lat] Fran: We do not need to center, but if we want, uncomment this line
      // zoom: 9, // starting zoom Fran: Do not use a zoom to center either, so uncomment if we finally want to do it
    });
    this.#addMarkersToMap();
    this.#fitMapToMarkers();
    this.map.addControl(
      new MapboxGeocoder({
        accessToken: mapboxgl.accessToken,
        mapboxgl: mapboxgl,
      })
    );
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds();
    this.markersValue.forEach((marker) => {
      bounds.extend([marker.lng, marker.lat]);
    });
    this.map.fitBounds(bounds, { padding: 50, duration: 10 });
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window_html);
      // !!adding a custom marker:
      // const customMarker = document.createElement("div")
      // customMarker.innerHTML = marker.marker_html

      new mapboxgl.Marker() //or add (customMarker) into the parenthesis if we want to add a new marker
        .setLngLat([marker.lng, marker.lat])
        .setPopup(popup)
        .addTo(this.map);
    });
  }
}
