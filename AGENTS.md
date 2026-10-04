# Website conventions

- Always use Font Awesome for interface icons. Use official Google Play app icons for catalog cards, resized to 128x128 WebP under content/mobile. Do not generate icons with AI or draw replacement icons in SVG.
- Keep the published app catalog consistent across all six languages. Verify names, package IDs and descriptions against https://play.google.com/store/apps/dev?id=4664158972622830717 before updating it.
- Keep Font Awesome assets and its license locally under content/fontawesome so icons do not require a third-party CDN at runtime.

- Keep new website resources under content. Existing root images (logo, pixel, banner, character, desktop, mobile, profile and social) and their WebP versions are an explicit exception: preserve them at the repository root. Use optimized WebP for visible site images and retain PNG originals. Other directories are used for unrelated tools.
- Keep the main navigation consistent across all languages: Home, Applications, Games, Programs, Contact, Resume, WIKI. Link to local pages and preserve the current page when switching languages.


- Keep Privacy linked in the footer of every page, outside the main navigation.
