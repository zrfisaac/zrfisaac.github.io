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

/* [ copy email ] */
function copyEmailFallback(email) {
    const field = document.createElement("textarea");
    field.value = email;
    field.setAttribute("readonly", "");
    field.style.position = "fixed";
    field.style.top = "0";
    field.style.left = "0";
    field.style.opacity = "0";
    document.body.appendChild(field);
    field.focus();
    field.select();
    field.setSelectionRange(0, email.length);
    try {
        return document.execCommand("copy");
    } catch {
        return false;
    } finally {
        field.remove();
    }
}

document.querySelectorAll("[data-copy-email]").forEach((button) => {
    let resetStatus;
    button.addEventListener("click", async () => {
        const email = button.dataset.copyEmail;
        const status = button.closest(".resume-profile").querySelector(".copy-email-status");
        let copied = false;
        // Run the fallback synchronously on HTTP, where Clipboard API is unavailable.
        if (!window.isSecureContext || !navigator.clipboard?.writeText) {
            copied = copyEmailFallback(email);
        } else {
            try {
                await navigator.clipboard.writeText(email);
                copied = true;
            } catch {
                copied = copyEmailFallback(email);
            }
        }
        button.focus();
        clearTimeout(resetStatus);
        status.textContent = copied ? button.dataset.copySuccess : button.dataset.copyError;
        status.classList.add("visible");
        resetStatus = setTimeout(() => {
            status.classList.remove("visible");
            status.textContent = "";
        }, 3000);
    });
});
