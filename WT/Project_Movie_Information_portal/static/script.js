/* MovieNest main script: single-page movie listing, details, favorites and ratings. */
let appMovies = getMovies(moviesData);

function reloadMovies() {
    appMovies = getMovies(moviesData);
}

function escapeHTML(value) {
    return String(value ?? "").replace(/[&<>"']/g, char => ({
        "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;", "'": "&#39;"
    }[char]));
}

// Theme preference
const themeButton = document.getElementById("theme");
const themeIcon = document.getElementById("theme-img");
function applySavedTheme() {
    let savedTheme = "dark";
    try { savedTheme = localStorage.getItem(STORAGE_KEYS.theme) || "dark"; } catch (_) {}
    const isDark = savedTheme !== "light";
    document.body.classList.toggle("dark-mode", isDark);
    if (themeIcon) {
        themeIcon.src = isDark ? "assets/moon.png" : "assets/sun.png";
        themeIcon.alt = isDark ? "Moon icon — switch to light theme" : "Sun icon — switch to dark theme";
    }
    if (themeButton) {
        themeButton.setAttribute("aria-pressed", String(isDark));
        themeButton.title = isDark ? "Switch to light theme" : "Switch to dark theme";
    }
}
applySavedTheme();
if (themeButton && themeIcon) {
    themeButton.addEventListener("click", () => {
        document.body.classList.toggle("dark-mode");
        const isDark = document.body.classList.contains("dark-mode");
        try { localStorage.setItem(STORAGE_KEYS.theme, isDark ? "dark" : "light"); } catch (_) {}
        themeIcon.src = isDark ? "assets/moon.png" : "assets/sun.png";
        themeIcon.alt = isDark ? "Moon icon — switch to light theme" : "Sun icon — switch to dark theme";
        themeButton.setAttribute("aria-pressed", String(isDark));
        themeButton.title = isDark ? "Switch to light theme" : "Switch to dark theme";
    });
}

// Search, genre/language filtering and sorting all update the same #Movies grid.
const searchInput = document.getElementById("search-input");
const sortSelect = document.getElementById("sort-select");
const urlParams = new URLSearchParams(window.location.search);
let selectedLanguage = urlParams.get("category") || "";
let selectedGenre = urlParams.get("genre") || "";
let selectedSearch = urlParams.get("search") || "";
let selectedSort = urlParams.get("sort") || "rating-desc";
if (searchInput) searchInput.value = selectedSearch;
if (sortSelect) sortSelect.value = selectedSort;

function updateUrl() {
    const params = new URLSearchParams();
    if (selectedLanguage) params.set("category", selectedLanguage);
    if (selectedGenre) params.set("genre", selectedGenre);
    if (selectedSearch.trim()) params.set("search", selectedSearch.trim());
    if (selectedSort && selectedSort !== "rating-desc") params.set("sort", selectedSort);
    const query = params.toString();
    const nextUrl = window.location.pathname + (query ? "?" + query : "") + (document.getElementById("all-movies") ? "#all-movies" : "");
    window.history.replaceState({}, "", nextUrl);
}

function getSortableRating(movie) {
    const memberSummary = getMovieRatingSummary(movie.id);
    return memberSummary.count ? memberSummary.average : Number(movie.rating || 0);
}

function getFilteredMovies() {
    let results = [...appMovies];
    if (selectedLanguage) results = results.filter(movie => (movie.language || "").toLowerCase() === selectedLanguage.toLowerCase());
    if (selectedGenre) results = results.filter(movie => (movie.genre || "").toLowerCase() === selectedGenre.toLowerCase());
    const query = selectedSearch.toLowerCase().trim();
    if (query) {
        results = results.filter(movie => {
            const values = [movie.title, movie.genre, movie.language, movie.director, movie.year, movie.duration,
                ...(Array.isArray(movie.cast) ? movie.cast : [])];
            return values.some(value => String(value || "").toLowerCase().includes(query));
        });
    }
    results.sort((a, b) => {
        switch (selectedSort) {
            case "title-asc": return (a.title || "").localeCompare(b.title || "");
            case "title-desc": return (b.title || "").localeCompare(a.title || "");
            case "rating-asc": return getSortableRating(a) - getSortableRating(b);
            case "year-desc": return Number(b.year || 0) - Number(a.year || 0);
            case "year-asc": return Number(a.year || 0) - Number(b.year || 0);
            case "rating-desc":
            default: return getSortableRating(b) - getSortableRating(a);
        }
    });
    return results;
}

function createMovieCard(movie) {
    const card = document.createElement("article");
    card.className = "movie-card col-6 col-md-4 col-lg-3 col-xxl-2";

    const cardBody = document.createElement("div");
    cardBody.className = "card movie-card-shell h-100 overflow-hidden";

    const imageLink = document.createElement("button");
    imageLink.type = "button";
    imageLink.className = "movie-poster-link card-img-button w-100 border-0 p-0";
    imageLink.setAttribute("aria-label", "View details for " + movie.title);
    imageLink.addEventListener("click", () => {
        window.location.href = "movie-details.html?id=" + encodeURIComponent(movie.id);
    });

    const image = document.createElement("img");
    image.src = movie.poster || "assets/logo.png";
    image.alt = movie.title || "Movie poster";
    image.loading = "lazy";
    image.className = "movie-poster-img card-img-top";
    image.onerror = () => { image.onerror = null; image.src = "assets/logo.png"; };
    imageLink.appendChild(image);

    const info = document.createElement("div");
    info.className = "card-body movie-card-info d-flex flex-column";

    const title = document.createElement("h3");
    title.className = "card-title h6 fw-bold";
    title.textContent = movie.title || "Untitled Movie";

    const genre = document.createElement("p");
    genre.className = "card-text small mb-1";
    genre.textContent = "Genre: " + (movie.genre || "N/A");

    const year = document.createElement("p");
    year.className = "card-text small mb-1";
    year.textContent = "Year: " + (movie.year || "N/A");

    const language = document.createElement("p");
    language.className = "card-text small mb-1";
    language.textContent = "Language: " + (movie.language || "N/A");

    const catalogRating = document.createElement("p");
    catalogRating.className = "movie-rating small mb-1";
    catalogRating.textContent = movie.rating === null || movie.rating === undefined
        ? "Catalog rating: Not available"
        : "Catalog rating: ⭐ " + Number(movie.rating).toFixed(1) + "/10";

    const summary = getMovieRatingSummary(movie.id);
    const communityRating = document.createElement("p");
    communityRating.className = "community-rating-mini small mb-2";
    communityRating.textContent = summary.count
        ? `Member rating: ⭐ ${summary.average}/10 (${summary.count} ${summary.count === 1 ? "rating" : "ratings"})`
        : "Member rating: Not rated yet";

    const actions = document.createElement("div");
    actions.className = "movie-card-actions d-grid gap-2 mt-auto pt-2";

    const favoriteButton = document.createElement("button");
    favoriteButton.type = "button";
    favoriteButton.className = "favorite-button btn btn-sm btn-outline-danger";
    function updateFavoriteButton() {
        const isFavorite = getFavorites().some(id => Number(id) === Number(movie.id));
        favoriteButton.textContent = isFavorite ? "♥ Favorited" : "♡ Favorite";
        favoriteButton.setAttribute("aria-pressed", String(isFavorite));
    }
    updateFavoriteButton();
    favoriteButton.addEventListener("click", () => {
        toggleFavorite(movie.id);
        updateFavoriteButton();
    });

    const detailsButton = document.createElement("button");
    detailsButton.type = "button";
    detailsButton.className = "details-button btn btn-sm btn-primary";
    detailsButton.textContent = "View Details";
    detailsButton.addEventListener("click", () => {
        window.location.href = "movie-details.html?id=" + encodeURIComponent(movie.id);
    });

    actions.append(favoriteButton, detailsButton);
    info.append(title, genre, year, language, catalogRating, communityRating, actions);
    cardBody.append(imageLink, info);
    card.appendChild(cardBody);
    return card;
}
function renderMovieCards(movieList, containerId = "Movies") {
    const container = document.getElementById(containerId);
    if (!container) return;
    container.replaceChildren();
    if (!movieList.length) {
        const message = document.createElement("p");
        message.className = "col-12 alert alert-secondary text-center no-results";
        message.textContent = "No movies found. Try another search or clear your filters.";
        container.appendChild(message);
        return;
    }
    movieList.forEach(movie => container.appendChild(createMovieCard(movie)));
}

function renderAllMovies() {
    const container = document.getElementById("Movies");
    if (!container) return;
    const filteredMovies = getFilteredMovies();
    renderMovieCards(filteredMovies, "Movies");
    const count = document.getElementById("movie-count");
    if (count) count.textContent = `${filteredMovies.length} of ${appMovies.length} movies`;
    const activeFilters = document.getElementById("active-filters");
    if (activeFilters) {
        const labels = [];
        if (selectedLanguage) labels.push("Language: " + selectedLanguage);
        if (selectedGenre) labels.push("Genre: " + selectedGenre);
        if (selectedSearch.trim()) labels.push('Search: "' + selectedSearch.trim() + '"');
        activeFilters.textContent = labels.length ? labels.join("  ·  ") : "Browse all movies";
    }
    document.querySelectorAll(".genre[data-genre]").forEach(item => {
        item.classList.toggle("active", item.dataset.genre.toLowerCase() === selectedGenre.toLowerCase());
    });
}

function handleSearch() {
    if (searchInput) selectedSearch = searchInput.value;
    updateUrl();
    renderAllMovies();
}
if (searchInput) {
    searchInput.addEventListener("input", handleSearch);
    searchInput.addEventListener("keydown", event => {
        if (event.key === "Enter") {
            event.preventDefault();
            handleSearch();
            document.getElementById("all-movies")?.scrollIntoView({ behavior: "smooth" });
        }
    });
}
if (sortSelect) sortSelect.addEventListener("change", () => {
    selectedSort = sortSelect.value;
    updateUrl();
    renderAllMovies();
});

function filterGenre(genre) {
    selectedGenre = selectedGenre.toLowerCase() === String(genre || "").toLowerCase() ? "" : (genre || "");
    updateUrl(); renderAllMovies();
    document.getElementById("all-movies")?.scrollIntoView({ behavior: "smooth", block: "start" });
}
function filterLanguage(language) {
    selectedLanguage = language || "";
    updateUrl(); renderAllMovies();
    document.getElementById("all-movies")?.scrollIntoView({ behavior: "smooth", block: "start" });
}
function clearMovieFilters() {
    selectedLanguage = ""; selectedGenre = ""; selectedSearch = ""; selectedSort = "rating-desc";
    if (searchInput) searchInput.value = "";
    if (sortSelect) sortSelect.value = selectedSort;
    updateUrl(); renderAllMovies();
}
const clearFiltersButton = document.getElementById("clear-filters");
if (clearFiltersButton) clearFiltersButton.addEventListener("click", clearMovieFilters);
renderAllMovies();

// Movie details: catalog score plus the average/count of member-submitted ratings.
function movieDetails() {
    const container = document.getElementById("movie-details");
    if (!container) return;
    reloadMovies();
    const id = Number(new URLSearchParams(window.location.search).get("id"));
    const movie = appMovies.find(item => Number(item.id) === id);
    if (!movie) {
        container.innerHTML = '<div class="col-12 movie-details-copy"><h1 class="h3">Movie not found</h1><p>This movie may have been removed by the admin.</p><a class="btn btn-primary" href="index.html">Back to movies</a></div>';
        return;
    }
    const summary = getMovieRatingSummary(movie.id);
    const ratingList = getMovieRatings(movie.id);
    const myRaterId = getRaterId();
    const existingRating = ratingList.find(item => item.raterId === myRaterId);
    const reviewsHTML = ratingList.filter(item => item.review).map(item => `
        <article class="member-review"><div><strong>${escapeHTML(item.name || "Guest")}</strong><span>⭐ ${Number(item.rating).toFixed(1)}/10</span></div><p>${escapeHTML(item.review)}</p></article>
    `).join("");

    container.innerHTML = `
        <div class="col-12 col-md-4 col-lg-3">
            <img class="details-poster img-fluid w-100 rounded-3" src="${escapeHTML(movie.poster || "assets/logo.png")}" alt="${escapeHTML(movie.title)}" onerror="this.onerror=null;this.src='assets/logo.png'">
        </div>
        <div class="col-12 col-md-8 col-lg-9 movie-details-copy">
            <a class="btn btn-link px-0 text-decoration-none" href="index.html">← Back to movies</a>
            <h1 class="h2 fw-bold mb-3">${escapeHTML(movie.title)}</h1>
            <div class="d-flex flex-wrap gap-2 mb-3">
                <span class="badge text-bg-primary">${escapeHTML(movie.genre || "N/A")}</span>
                <span class="badge text-bg-secondary">${escapeHTML(movie.year || "N/A")}</span>
                <span class="badge text-bg-secondary">${escapeHTML(movie.language || "N/A")}</span>
                <span class="badge text-bg-secondary">${escapeHTML(movie.duration || "Duration N/A")}</span>
            </div>
            <p><strong>Director:</strong> ${escapeHTML(movie.director || "Not available")}</p>
            <p><strong>Cast:</strong> ${escapeHTML(Array.isArray(movie.cast) ? movie.cast.join(", ") : movie.cast || "Not available")}</p>
            <p><strong>Catalog rating:</strong> ${movie.rating === null || movie.rating === undefined ? "Not available yet" : "⭐ " + escapeHTML(Number(movie.rating).toFixed(1)) + "/10"}</p>
            <div class="overall-rating card card-body border-warning-subtle mb-3"><div class="d-flex align-items-center gap-3"><span class="overall-rating-score">${summary.count ? "⭐ " + summary.average : "—"}</span><span><strong>Member overall rating</strong><small class="d-block">${summary.count} ${summary.count === 1 ? "rating" : "ratings"} submitted</small></span></div></div>
            <p class="details-description">${escapeHTML(movie.description || "No description available.")}</p>
            ${movie.trailer ? `<a class="btn btn-outline-primary me-2 mb-2" href="${escapeHTML(movie.trailer)}" target="_blank" rel="noopener noreferrer">Watch / Find Trailer</a>` : ""}
            <button class="btn btn-outline-danger details-favorite mb-3" type="button">${getFavorites().some(fav => Number(fav) === Number(movie.id)) ? "♥ Remove Favorite" : "♡ Add to Favorites"}</button>
            <section class="rating-form-panel card border-0 bg-body-tertiary mb-4"><div class="card-body">
                <h2 class="h5 fw-bold">Rate this movie</h2>
                <p class="small text-body-secondary">Give it a score from 1 to 10. Your rating is included in the member average.</p>
                <form id="member-rating-form">
                    <label for="member-rating" class="form-label">Your rating</label>
                    <select id="member-rating" class="form-select mb-3" required>
                        ${Array.from({ length: 10 }, (_, i) => 10 - i).map(value => `<option value="${value}" ${Number(existingRating?.rating) === value ? "selected" : ""}>${value}/10${value === 10 ? " — Excellent" : value === 1 ? " — Poor" : ""}</option>`).join("")}
                    </select>
                    <label for="member-review" class="form-label">Review (optional)</label>
                    <textarea id="member-review" class="form-control mb-3" rows="3" maxlength="1000" placeholder="What did you think of the movie?">${escapeHTML(existingRating?.review || "")}</textarea>
                    <button class="btn btn-primary" type="submit">${existingRating ? "Update My Rating" : "Submit Rating"}</button>
                    <p id="rating-feedback" class="small mt-2 mb-0" aria-live="polite"></p>
                </form>
            </div></section>
            <section class="member-reviews"><h2 class="h5 fw-bold mb-3">Member reviews</h2>${reviewsHTML || '<p class="text-body-secondary small">No written reviews yet. Be the first to share your thoughts.</p>'}</section>
        </div>`;

    const poster = container.querySelector(".details-poster");
    if (poster) poster.addEventListener("error", () => { poster.onerror = null; poster.src = "assets/logo.png"; });
    container.querySelector(".details-favorite")?.addEventListener("click", () => { toggleFavorite(movie.id); movieDetails(); });
    container.querySelector("#member-rating-form")?.addEventListener("submit", event => {
        event.preventDefault();
        const rating = Number(container.querySelector("#member-rating").value);
        const review = container.querySelector("#member-review").value;
        if (!saveMovieRating(movie.id, rating, review)) {
            container.querySelector("#rating-feedback").textContent = "Could not save your rating. Check browser storage and try again.";
            return;
        }
        movieDetails();
        const feedback = container.querySelector("#rating-feedback");
        if (feedback) feedback.textContent = "Your rating was saved.";
    });
}
movieDetails();

// Favorites page
function renderFavoriteMovies() {
    const container = document.getElementById("fev-movies");
    if (!container) return;
    reloadMovies();
    const ids = getFavorites().map(Number);
    renderMovieCards(appMovies.filter(movie => ids.includes(Number(movie.id))), "fev-movies");
}
renderFavoriteMovies();
