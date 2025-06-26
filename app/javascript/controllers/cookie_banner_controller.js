import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    connect() {
        const consent = localStorage.getItem("cookieConsent");
        if (!consent) {
            this.element.style.display = "flex";
        }
    }

    accept() {
        localStorage.setItem("cookieConsent", "accepted");
        this.element.style.display = "none";
    }

    decline() {
        localStorage.setItem("cookieConsent", "declined");
        this.element.style.display = "none";
    }
}
