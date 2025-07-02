import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["button", "overlay", "menu"]

  toggle() {
    this.menuTarget.classList.toggle("open")
    this.overlayTarget.classList.toggle("visible")
  }
}
