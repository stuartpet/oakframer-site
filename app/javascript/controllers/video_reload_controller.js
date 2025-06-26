import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    connect() {
        const video = this.element
        // Reload on connect to fix mobile autoplay issue
        video.load()
        video.play().catch(() => {}) // gracefully handle block
    }
}
