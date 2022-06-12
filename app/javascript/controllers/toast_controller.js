import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toast"
export default class extends Controller {
  static targets = ['toast']

  connect() {
  }

  close() {
    this.toastTarget.classList.add('hidden')
  }
}
