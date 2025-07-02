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

    if (document.querySelector('#project-carousel')) {
        if (window.Splide && document.getElementById('project-carousel')) {
            const main = new Splide('#project-carousel', {
                type: 'loop',
                perPage: 1,
                autoplay: true,
                interval: 2000,
                pauseOnHover: true,
                arrows: true,
                drag: true,
                pagination: false, // we'll use thumbnails
                heightRatio: 0.5,
            });

            const thumbs = new Splide('#project-thumbnails', {
                fixedWidth: 100,
                fixedHeight: 64,
                isNavigation: true,
                gap: 10,
                focus: 'center',
                pagination: false,
                cover: true,
                arrows: false,
                drag: true,
                breakpoints: {
                    600: {
                        fixedWidth: 66,
                        fixedHeight: 40,
                    },
                },
            });

            main.sync(thumbs);
            main.mount();
            thumbs.mount();
        }
    }

    if (typeof GLightbox !== "undefined") {
        GLightbox({ selector: ".glightbox" });
    }
});


