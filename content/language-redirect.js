const destinations = new Map(
    Array.from(document.querySelectorAll("a[hreflang]"), (link) => [link.hreflang, link.href])
);

let savedLanguage;
try {
    savedLanguage = localStorage.getItem("zrf-language");
} catch {
    // Use the browser language when storage is unavailable.
}

const browserLanguage = (navigator.language || "en").toLowerCase().split("-")[0];
const destination = destinations.get(savedLanguage) || destinations.get(browserLanguage) || destinations.get("en");
location.replace(destination + location.search + location.hash);
