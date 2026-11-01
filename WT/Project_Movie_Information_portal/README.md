# MovieNest — updated project

## Run the website

Open the project folder in VS Code and use **Live Server** to open `index.html`. This is recommended because account password hashing uses the Web Crypto API, which is not available in every `file://` browser context.

## What changed

- The full movie listing is now on `index.html`; the separate `movies.html` page has been removed.
- The search bar is below the navbar and filters as you type.
- Language links and genre tiles filter the movie listing on the same home page.
- Sorting is available by title (A–Z / Z–A), rating, and year.
- Favorite selections persist in LocalStorage and appear on `fav-movies.html`.
- The initial movie records are saved to LocalStorage, and the chosen theme is remembered.
- Registration stores account profile details locally and stores a salted password hash, not the plain-text password. Login checks those saved demo accounts.

## Current movie data

`static/movie_details.js` contains **25 movie objects with full metadata**. Poster files that are not represented by a movie object are not automatically added to the searchable catalog. Use **Account → Admin Panel** to create complete records for more titles so they become searchable, sortable, ratable, and available in favorites.

## LocalStorage note

This is a front-end demonstration. LocalStorage data is kept in the current browser and is not shared between devices or users. Client-side registration/login is not production authentication; a real public website should use a backend and database.


## Recent MovieNest updates

- Search and sorting are next to each other below the navigation bar; genre buttons are directly underneath.
- Movie results are displayed in one grid on `index.html`; older High Rated, Featured, and Trending rows have been removed from the homepage.
- Open **Account → Admin Panel** to add a movie or remove one. Fields include title, poster path/URL, genre, year, language, duration, director, cast, catalog rating, description, and trailer URL. IDs are created automatically.
- Open a movie's details to submit a 1–10 member rating and optional written review. The page shows average member rating and number of ratings. A signed-in account can update its own rating; guests are tracked by this browser.
- Movie data, favorites, and member ratings use LocalStorage. These changes are local to the current browser/device. The Admin Panel is a front-end demo only; use backend authorization and a database before deployment.
- Poster art is displayed without cropping via `object-fit: contain`. Poster files should be reasonably high-resolution for the clearest result.

Run the project through VS Code Live Server.


## Phase 3 — catalog and theme polish

- The starter catalog now includes 25 movie records with searchable metadata. Nineteen use poster files included in `assets/Movies/` or `assets/animal.jpg`; six use TMDB poster-image URLs and therefore need an internet connection to load.
- Browsers that had the earlier 5-movie seed are migrated once by adding missing titles while preserving saved records and custom movies. An intentionally empty movie list stays empty.
- The theme switch now keeps the moon/sun artwork at its natural aspect ratio inside a pill-shaped button, and remains available on desktop, tablet, and mobile. The current choice remains saved in LocalStorage.
- Movies without a dependable catalogue score display “Not available yet” instead of showing a misleading zero score.

For a reliable demonstration, open `index.html` via VS Code Live Server.


## Responsive UI (Bootstrap 5.3.8)

The pages use Bootstrap 5.3.8 through the official jsDelivr CDN for the responsive grid, cards, navbar, buttons and forms. Project-specific colors, fonts and theme overrides are kept in `static/custom.css`. The previous separate desktop/tablet/mobile CSS files were consolidated into this single small stylesheet. An internet connection is required to load Bootstrap and the Inter font from their CDNs.

## Bootstrap classes used (useful for project evaluation)

- `container`: keeps page content centered with responsive side spacing.
- `row` and `g-3` / `g-4`: create a responsive grid and spacing between columns.
- `col-6 col-md-4 col-lg-3 col-xxl-2`: show movie cards in 2 columns on phones, 3 on medium screens, 4 on large screens and 6 on extra-large screens.
- `card`, `card-body`, `shadow-sm`: provide reusable movie, form and content cards.
- `form-control` and `form-select`: style text inputs, textareas and dropdowns.
- `btn`, `btn-primary`, `btn-outline-secondary`: consistent button styling.
- `navbar`, `navbar-expand-lg`, `collapse`, `dropdown`: responsive navigation and dropdown menus.
- `d-flex`, `flex-wrap`, `gap-*`, `align-items-center`, `justify-content-between`: responsive alignment without writing custom flexbox CSS.

Only project branding, colors, poster sizing and dark/light theme overrides are written in `static/custom.css`.
