import {Controller} from "@hotwired/stimulus";

export default class extends Controller {
    connect() {
        window.addEventListener("scroll", () => {
            const btn = document.querySelector(".scroll-to-top");
            if (window.scrollY > 300) {
                btn.style.display = "block";
            } else {
                btn.style.display = "none";
            }
        });
    }

    toTop() {
        window.scrollTo({ top: 0, behavior: 'smooth' });
    }
}
