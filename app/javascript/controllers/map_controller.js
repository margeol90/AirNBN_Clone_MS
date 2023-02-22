import { Controller } from "@hotwired/stimulus";

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
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      new mapboxgl.Marker().setLngLat([marker.lng, marker.lat]).addTo(this.map);
    });
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds();
    this.markersValue.forEach((marker) => {
      bounds.extend([marker.lng, marker.lat]);
    });
    this.map.fitBounds(bounds, { padding: 50, duration: 150 });
  }
}
