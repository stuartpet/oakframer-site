import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    connect() {
        if (localStorage.getItem("cookieConsent") === "accepted") {
            this.element.style.display = "none"
        }
    }

    accept() {
        localStorage.setItem("cookieConsent", "accepted")
        this.element.style.display = "none"
    }

    decline() {
        // No cookies are used, so just hide it
        localStorage.setItem("cookieConsent", "declined")
        this.element.style.display = "none"
    }
}
