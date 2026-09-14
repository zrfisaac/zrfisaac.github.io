/*
 * [ zrfisaac ]
 *
 * [ about ]
 * - author  : Isaac Caires Santana
 * . - email : zrfisaac@gmail.com
 * . - site  : zrfisaac.github.io
 * - version : zrfisaac.web.script : 26.8.30.1
 */

/* [ external links ] */

document.querySelectorAll("a[href]").forEach((link) => {
    const destination = link.getAttribute("href");
    const isExternal = destination.startsWith("http://") || destination.startsWith("https://");

    if (isExternal) {
        link.target = "_blank";
        link.rel = "noopener noreferrer";
    }
});

/* [ language ] */

const language = document.querySelector(".language");
const languageButton = document.querySelector(".language-button");
const languageOptions = document.querySelector(".language-options");

if (languageButton && languageOptions) {
    languageButton.addEventListener("click", () => {
        languageOptions.classList.toggle("open");
    });

    document.addEventListener("click", (event) => {
        if (!language.contains(event.target)) {
            languageOptions.classList.remove("open");
        }
    });
}

document.querySelectorAll("[data-language]").forEach((link) => {
    link.addEventListener("click", () => {
        localStorage.setItem("zrf-language", link.dataset.language);
    });
});

/* [ mobile menu ] */

const navigation = document.querySelector(".navigation");
const menuButton = document.querySelector(".menu-button");

if (navigation && menuButton) {
    menuButton.addEventListener("click", () => {
        navigation.classList.toggle("open");
    });
}
