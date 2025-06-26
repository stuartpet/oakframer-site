import "@hotwired/turbo-rails"
import "./controllers"
document.addEventListener("turbo:load", function () {
    // Smooth scroll for anchor links
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener("click", function (e) {
            e.preventDefault();
            const target = document.querySelector(this.getAttribute("href"));
            if (target) {
                target.scrollIntoView({ behavior: "smooth" });
            }

            const nav = document.getElementById("navbar-links");
            if (nav && window.innerWidth < 768) {
                nav.classList.remove("open");
            }
        });
    });

    // Smooth scroll on load if URL has a hash
    if (window.location.hash) {
        const target = document.querySelector(window.location.hash);
        if (target) {
            setTimeout(() => {
                target.scrollIntoView({ behavior: "smooth" });
            }, 100); // Delay to allow layout to settle
        }
    }

    // Mobile menu toggle
    const toggle = document.querySelector(".menu-toggle");
    const menu = document.getElementById("navbar-links");

    if (toggle && menu) {
        toggle.addEventListener("click", function () {
            menu.classList.toggle("open");
        });
    }
});


