// =======================================================
// YUMMY - MAIN JAVASCRIPT
// =======================================================

document.addEventListener("DOMContentLoaded", () => {

    // ===================================================
    // ELEMENTS
    // ===================================================

    const hamburger = document.getElementById("hamburger");
    const navLinks = document.querySelector(".nav-links");
    const navbar = document.querySelector(".navbar");
    const navCart = document.querySelector(".nav-cart");

    const profile = document.querySelector(".profile");
    const sidebarProfile = document.querySelector(".sidebar-profile");
    const sidebarProfileToggle = document.getElementById("sidebarProfileToggle");

    // ===================================================
    // MOBILE SIDEBAR
    // ===================================================

    if (hamburger && navLinks) {

        hamburger.addEventListener("click", () => {

            hamburger.classList.toggle("active");
            navLinks.classList.toggle("active");
            document.body.classList.toggle("menu-open");

        });

    }

    // ===================================================
    // CLOSE SIDEBAR AFTER CLICKING MENU
    // ===================================================

    if (navLinks) {

        document.querySelectorAll(".nav-links a").forEach(link => {

            link.addEventListener("click", () => {

                navLinks.classList.remove("active");

                if (hamburger)
                    hamburger.classList.remove("active");

                document.body.classList.remove("menu-open");

            });

        });

    }

    // ===================================================
    // PROFILE DROPDOWN (DESKTOP)
    // ===================================================

    if (profile) {

        profile.addEventListener("click", (e) => {

            e.stopPropagation();
            profile.classList.toggle("active");

        });

        document.addEventListener("click", () => {

            profile.classList.remove("active");

        });

    }

    // ===================================================
    // MOBILE PROFILE TOGGLE
    // ===================================================

    if (sidebarProfileToggle && sidebarProfile) {

        sidebarProfileToggle.addEventListener("click", (e) => {

            e.stopPropagation();
            sidebarProfile.classList.toggle("active");

        });

    }

    // ===================================================
    // CLOSE SIDEBAR AFTER PROFILE CLICK
    // ===================================================

    document.querySelectorAll(".sidebar-profile a").forEach(link => {

        link.addEventListener("click", () => {

            if (navLinks)
                navLinks.classList.remove("active");

            if (hamburger)
                hamburger.classList.remove("active");

            document.body.classList.remove("menu-open");

        });

    });

    // ===================================================
    // MOVE CART TO SIDEBAR
    // ===================================================

    function handleCartPosition() {

        if (!navCart || !navbar)
            return;

        if (window.innerWidth <= 900) {

            const sidebar = document.querySelector(".sidebar-profile");

            if (sidebar && !sidebar.contains(navCart)) {

                sidebar.appendChild(navCart);
                navCart.classList.add("mobile-cart");

            }

        } else {

            const navRight = document.querySelector(".nav-right");

            if (navRight && !navbar.contains(navCart)) {

                navbar.insertBefore(navCart, navRight);
                navCart.classList.remove("mobile-cart");

            }

        }

    }

    handleCartPosition();

    window.addEventListener("resize", handleCartPosition);

    // ===================================================
    // OFFER COUNTDOWN
    // ===================================================

    const hoursEl = document.getElementById("hours");
    const minutesEl = document.getElementById("minutes");
    const secondsEl = document.getElementById("seconds");

    if (hoursEl && minutesEl && secondsEl) {

        let totalTime = 2 * 60 * 60 + 15 * 60 + 10;

        setInterval(() => {

            if (totalTime <= 0)
                return;

            totalTime--;

            const h = Math.floor(totalTime / 3600);
            const m = Math.floor((totalTime % 3600) / 60);
            const s = totalTime % 60;

            hoursEl.textContent = String(h).padStart(2, "0");
            minutesEl.textContent = String(m).padStart(2, "0");
            secondsEl.textContent = String(s).padStart(2, "0");

        }, 1000);

    }

});

// =======================================================
// PRELOADER
// =======================================================

window.addEventListener("load", () => {

    const preloader = document.getElementById("preloader");
    const percentText = document.getElementById("loadPercent");

    if (!preloader)
        return;

    let percent = 0;

    const loading = setInterval(() => {

        percent++;

        if (percentText) {

            percentText.textContent = percent + "%";

        }

        if (percent >= 100) {

            clearInterval(loading);

            setTimeout(() => {

                preloader.style.opacity = "0";
                preloader.style.pointerEvents = "none";

                setTimeout(() => {

                    preloader.style.display = "none";

                }, 600);

            }, 300);

        }

    }, 20);

});