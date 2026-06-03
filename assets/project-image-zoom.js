(() => {
    const images = Array.from(document.querySelectorAll("main article picture img, main article img[data-zoomable]"));

    if (!images.length) {
        return;
    }

    const style = document.createElement("style");
    style.textContent = `
        .zrf-zoomable-image { cursor: zoom-in; }
        .zrf-image-zoom {
            align-items: center;
            background: rgba(5, 5, 7, 0.92);
            backdrop-filter: blur(14px);
            display: flex;
            inset: 0;
            justify-content: center;
            opacity: 0;
            padding: 24px;
            pointer-events: none;
            position: fixed;
            transition: opacity 160ms ease;
            z-index: 80;
        }
        .zrf-image-zoom.is-open {
            opacity: 1;
            pointer-events: auto;
        }
        .zrf-image-zoom img {
            border: 1px solid rgba(216, 180, 254, 0.25);
            border-radius: 8px;
            box-shadow: 0 24px 90px rgba(0, 0, 0, 0.55);
            max-height: min(86vh, 900px);
            max-width: min(92vw, 1180px);
            object-fit: contain;
        }
        .zrf-image-zoom button {
            align-items: center;
            background: rgba(13, 13, 16, 0.92);
            border: 1px solid rgba(255, 255, 255, 0.12);
            border-radius: 8px;
            color: white;
            cursor: pointer;
            display: grid;
            height: 44px;
            justify-content: center;
            position: fixed;
            right: 18px;
            top: 18px;
            width: 44px;
        }
        .zrf-image-zoom button:hover {
            border-color: rgba(216, 180, 254, 0.72);
        }
    `;
    document.head.appendChild(style);

    const overlay = document.createElement("div");
    overlay.className = "zrf-image-zoom";
    overlay.setAttribute("aria-hidden", "true");
    overlay.innerHTML = `
        <button type="button" aria-label="Close image preview">
            <svg viewBox="0 0 24 24" width="22" height="22" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                <path d="M18 6 6 18"></path>
                <path d="m6 6 12 12"></path>
            </svg>
        </button>
        <img alt="">
    `;
    document.body.appendChild(overlay);

    const preview = overlay.querySelector("img");
    const closeButton = overlay.querySelector("button");

    const close = () => {
        overlay.classList.remove("is-open");
        overlay.setAttribute("aria-hidden", "true");
        document.body.style.overflow = "";
    };

    const open = (image) => {
        preview.src = image.currentSrc || image.src;
        preview.alt = image.alt || "";
        overlay.classList.add("is-open");
        overlay.setAttribute("aria-hidden", "false");
        document.body.style.overflow = "hidden";
    };

    images.forEach((image) => {
        image.classList.add("zrf-zoomable-image");
        image.addEventListener("click", () => open(image));
    });

    overlay.addEventListener("click", (event) => {
        if (event.target === overlay) {
            close();
        }
    });
    closeButton.addEventListener("click", close);
    document.addEventListener("keydown", (event) => {
        if (event.key === "Escape") {
            close();
        }
    });
})();
