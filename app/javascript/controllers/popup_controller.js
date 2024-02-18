import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";


// Connects to data-controller="popup"
export default class extends Controller {
  static targets = ["popupElement"]
  connect() {
    console.log("Hello ready to pop up")
    // flatpickr(this.element)
  }

  fire() {
    console.log("flexing")
    console.log(this.popupElementTarget.style.display = "flex")
  }

  close() {
    console.log("closing")
    console.log(this.popupElementTarget.style.display = "none")
  }
}
