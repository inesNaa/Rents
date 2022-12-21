import { Controller } from "@hotwired/stimulus"
import Flatpickr from 'stimulus-flatpickr'
import { French } from 'flatpickr/dist/l10n/fr.js'

import flatpickr from "flatpickr"

// Connects to data-controller="flatpickr"
// export default class extends Controller {
//   connect() {
//   }
// }

export default class extends Flatpickr {

  static targets = ["beginDate"]

  initialize() {
    // sets your language (you can also set some global setting for all time pickers)
    this.config = {
      mode: "range",
      locale: French,
      minDate: "today",
      altInput: true,
      altFormat: "j F, Y",
      dateFormat: "d.m.Y"

      // disable: unavailableDates

    }
  }

  connect(){
    flatpickr(this.beginDateTarget, {inline: true})
  }
}
