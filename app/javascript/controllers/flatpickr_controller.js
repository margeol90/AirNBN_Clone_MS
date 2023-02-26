import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";

// Connects to data-controller="flatpickr"
export default class extends Controller {
  static targets = [ "startTime", "endTime" ]

  connect() {
    flatpickr(this.startTimeTarget, {
      minDate: "today"
    })
    flatpickr(this.endTimeTarget, {
      minDate: "tomorrow"
    })
    this.startTimeTarget.addEventListener("change", (e) => {
      if (this.startTimeTarget != "") {
        this.endTimeTarget.disabled = false
      }
      flatpickr(this.endTimeTarget, {
        minDate: e.target.value
        });
    })
  }
}
