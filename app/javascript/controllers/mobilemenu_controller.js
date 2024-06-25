import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["menu"]

    toggle() {
        console.log('output');
      this.menuTarget.classList.toggle("hidden")
    }
}
