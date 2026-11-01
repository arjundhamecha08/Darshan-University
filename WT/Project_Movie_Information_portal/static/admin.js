/* Browser-local MovieNest movie manager. Admin controls must move server-side for production. */
const adminForm = document.getElementById("admin-movie-form");
const adminList = document.getElementById("admin-movie-list");
const adminFeedback = document.getElementById("admin-feedback");
const adminSearch = document.getElementById("admin-list-search");
const posterField = document.getElementById("movie-poster");
const posterPreview = document.getElementById("poster-preview");
const posterPreviewLabel = document.getElementById("poster-preview-label");
let adminMovies = getMovies(moviesData);

function adminEscape(value) {
    return String(value ?? "").replace(/[&<>"']/g, char => ({ "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;", "'": "&#39;" }[char]));
}
function refreshAdminMovies() {
    adminMovies = getMovies(moviesData);
    renderAdminMovieList();
}
function updatePosterPreview() {
    const poster = posterField.value.trim();
    posterPreview.src = poster || "assets/logo.png";
    posterPreviewLabel.textContent = poster || "Enter a poster path or URL above.";
}
posterField.addEventListener("input", updatePosterPreview);
posterPreview.addEventListener("error", () => {
    posterPreview.onerror = null;
    posterPreview.src = "assets/logo.png";
    posterPreviewLabel.textContent = "Preview unavailable — check the poster path or URL.";
});

function renderAdminMovieList() {
    const query = (adminSearch?.value || "").trim().toLowerCase();
    const movies = adminMovies.filter(movie => String(movie.title || "").toLowerCase().includes(query));
    document.getElementById("admin-movie-count").textContent = `${adminMovies.length} ${adminMovies.length === 1 ? "movie" : "movies"} total`;
    adminList.replaceChildren();
    if (!movies.length) {
        const empty = document.createElement("p");
        empty.className = "text-center text-body-secondary p-4";
        empty.textContent = query ? "No movie title matches your search." : "Your movie library is empty. Add a movie using the form above.";
        adminList.appendChild(empty);
        return;
    }
    movies.forEach(movie => {
        const row = document.createElement("article");
        row.className = "list-group-item d-flex align-items-center gap-3 flex-wrap rounded-3";
        const poster = document.createElement("img");
        poster.className = "admin-movie-thumb rounded";
        poster.src = movie.poster || "assets/logo.png";
        poster.alt = "";
        poster.onerror = () => { poster.onerror = null; poster.src = "assets/logo.png"; };
        const info = document.createElement("div");
        info.className = "admin-movie-info flex-grow-1 min-w-0";
        const title = document.createElement("h3"); title.className = "h6 fw-bold mb-1"; title.textContent = movie.title || "Untitled Movie";
        const meta = document.createElement("p"); meta.className = "small text-body-secondary mb-1"; meta.textContent = `${movie.year || "Year N/A"} · ${movie.genre || "Genre N/A"} · ${movie.language || "Language N/A"} · Catalog ⭐ ${movie.rating ?? "N/A"}/10`;
        const id = document.createElement("small"); id.className = "text-body-secondary"; id.textContent = `Movie ID: ${movie.id}`;
        info.append(title, meta, id);
        const removeButton = document.createElement("button");
        removeButton.type = "button";
        removeButton.className = "btn btn-sm btn-outline-danger ms-auto";
        removeButton.textContent = "Remove movie";
        removeButton.addEventListener("click", () => {
            if (!window.confirm(`Remove “${movie.title}” from MovieNest? This also removes its favorites and member ratings on this browser.`)) return;
            adminMovies = adminMovies.filter(item => Number(item.id) !== Number(movie.id));
            if (!saveMovies(adminMovies)) {
                adminFeedback.textContent = "Could not save the changes. Your browser storage may be full.";
                return;
            }
            removeMovieRelatedData(movie.id);
            adminFeedback.textContent = `Removed “${movie.title}”.`;
            refreshAdminMovies();
        });
        row.append(poster, info, removeButton);
        adminList.appendChild(row);
    });
}

adminForm.addEventListener("submit", event => {
    event.preventDefault();
    adminFeedback.textContent = "";
    const title = document.getElementById("movie-title").value.trim();
    const poster = posterField.value.trim();
    const genre = document.getElementById("movie-genre").value.trim();
    const year = Number(document.getElementById("movie-year").value);
    const language = document.getElementById("movie-language").value.trim();
    const duration = document.getElementById("movie-duration").value.trim();
    const director = document.getElementById("movie-director").value.trim();
    const cast = document.getElementById("movie-cast").value.split(",").map(name => name.trim()).filter(Boolean);
    const rating = Number(document.getElementById("movie-rating").value);
    const description = document.getElementById("movie-description").value.trim();
    const trailer = document.getElementById("movie-trailer").value.trim();

    if (!title || !poster || !genre || !year || !language || !description || !Number.isFinite(rating) || rating < 0 || rating > 10) {
        adminFeedback.textContent = "Please complete all required fields and use a rating between 0 and 10.";
        return;
    }
    if (adminMovies.some(movie => String(movie.title || "").trim().toLowerCase() === title.toLowerCase())) {
        adminFeedback.textContent = "A movie with this title already exists. Remove the old entry or choose a unique title.";
        return;
    }
    const numericIds = adminMovies.map(movie => Number(movie.id)).filter(Number.isFinite);
    const newMovie = {
        id: (numericIds.length ? Math.max(...numericIds) : 0) + 1,
        title, poster, genre, year, language, duration, director, cast, rating,
        description, trailer
    };
    const updatedMovies = [...adminMovies, newMovie];
    if (!saveMovies(updatedMovies)) {
        adminFeedback.textContent = "Could not save this movie. LocalStorage may be full.";
        return;
    }
    adminMovies = updatedMovies;
    adminFeedback.textContent = `Added “${title}” successfully. It will appear on the home page.`;
    adminForm.reset();
    updatePosterPreview();
    renderAdminMovieList();
});

document.getElementById("reset-movie-form").addEventListener("click", () => {
    adminForm.reset();
    updatePosterPreview();
    adminFeedback.textContent = "";
});
adminSearch.addEventListener("input", renderAdminMovieList);
refreshAdminMovies();
