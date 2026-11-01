/* MovieNest browser-local storage helpers.
   This is a front-end demo. Real accounts/admin controls require a server. */
const STORAGE_KEYS = {
    movies: "movieNestMovies",
    favorites: "movieNestFavorites",
    users: "movieNestUsers",
    currentUser: "movieNestCurrentUser",
    theme: "movieNestTheme",
    ratings: "movieNestRatings",
    guestId: "movieNestGuestId",
    catalogVersion: "movieNestCatalogVersion"
};

function readStoredData(key, fallbackValue) {
    try {
        const storedValue = localStorage.getItem(key);
        return storedValue === null ? fallbackValue : JSON.parse(storedValue);
    } catch (error) {
        console.warn("Could not read LocalStorage key:", key, error);
        return fallbackValue;
    }
}

function saveStoredData(key, value) {
    try {
        localStorage.setItem(key, JSON.stringify(value));
        return true;
    } catch (error) {
        console.error("Could not save LocalStorage key:", key, error);
        return false;
    }
}

function saveMovies(movieList) {
    return saveStoredData(STORAGE_KEYS.movies, movieList);
}

function getMovies(defaultMovies = []) {
    const catalogVersion = "phase3-25-movies";
    const storedMovies = readStoredData(STORAGE_KEYS.movies, null);

    // First-time visitor: seed the complete catalog.
    if (!Array.isArray(storedMovies)) {
        saveMovies(defaultMovies);
        try { localStorage.setItem(STORAGE_KEYS.catalogVersion, catalogVersion); } catch (_) {}
        return defaultMovies;
    }

    // Preserve an intentionally empty library, for example after the admin removed every title.
    if (storedMovies.length === 0) {
        try { localStorage.setItem(STORAGE_KEYS.catalogVersion, catalogVersion); } catch (_) {}
        return storedMovies;
    }

    // Upgrade browsers that were using the earlier 5-movie seed. Merge by title so
    // existing movie edits, favourites, ratings, and admin-added records remain intact.
    let currentVersion = "";
    try { currentVersion = localStorage.getItem(STORAGE_KEYS.catalogVersion) || ""; } catch (_) {}
    if (currentVersion !== catalogVersion) {
        const merged = [...storedMovies];
        const normalizeTitle = title => String(title || "").trim().toLowerCase();
        let nextId = Math.max(0, ...merged.map(movie => Number(movie.id) || 0), ...defaultMovies.map(movie => Number(movie.id) || 0)) + 1;

        for (const seedMovie of defaultMovies) {
            if (merged.some(movie => normalizeTitle(movie.title) === normalizeTitle(seedMovie.title))) continue;
            const movieToAdd = { ...seedMovie };
            if (merged.some(movie => Number(movie.id) === Number(movieToAdd.id))) {
                movieToAdd.id = nextId++;
            }
            merged.push(movieToAdd);
        }
        saveMovies(merged);
        try { localStorage.setItem(STORAGE_KEYS.catalogVersion, catalogVersion); } catch (_) {}
        return merged;
    }

    return storedMovies;
}
function getFavorites() {
    const favorites = readStoredData(STORAGE_KEYS.favorites, []);
    return Array.isArray(favorites) ? favorites : [];
}

function saveFavorites(movieIds) {
    return saveStoredData(STORAGE_KEYS.favorites, movieIds);
}

function toggleFavorite(movieId) {
    const favorites = getFavorites();
    const alreadySaved = favorites.some(id => Number(id) === Number(movieId));
    const updatedFavorites = alreadySaved
        ? favorites.filter(id => Number(id) !== Number(movieId))
        : [...favorites, Number(movieId)];
    saveFavorites(updatedFavorites);
    return updatedFavorites;
}

function getUsers() {
    const users = readStoredData(STORAGE_KEYS.users, []);
    return Array.isArray(users) ? users : [];
}

function saveUsers(users) {
    return saveStoredData(STORAGE_KEYS.users, users);
}

function getCurrentUser() {
    return readStoredData(STORAGE_KEYS.currentUser, null)
        || readStoredDataFromSession(STORAGE_KEYS.currentUser);
}

function readStoredDataFromSession(key) {
    try {
        const stored = sessionStorage.getItem(key);
        return stored ? JSON.parse(stored) : null;
    } catch (_) {
        return null;
    }
}

function getRaterId() {
    const user = getCurrentUser();
    if (user && user.id !== undefined) return "user:" + user.id;
    let guestId = localStorage.getItem(STORAGE_KEYS.guestId);
    if (!guestId) {
        guestId = "guest:" + (window.crypto?.randomUUID ? crypto.randomUUID() : Date.now() + "-" + Math.random().toString(16).slice(2));
        localStorage.setItem(STORAGE_KEYS.guestId, guestId);
    }
    return guestId;
}

function getAllRatings() {
    const ratings = readStoredData(STORAGE_KEYS.ratings, {});
    return ratings && typeof ratings === "object" && !Array.isArray(ratings) ? ratings : {};
}

function getMovieRatings(movieId) {
    const allRatings = getAllRatings();
    const list = allRatings[String(movieId)];
    return Array.isArray(list) ? list : [];
}

function getMovieRatingSummary(movieId) {
    const ratings = getMovieRatings(movieId);
    if (!ratings.length) return { average: null, count: 0 };
    const average = ratings.reduce((total, item) => total + Number(item.rating || 0), 0) / ratings.length;
    return { average: Math.round(average * 10) / 10, count: ratings.length };
}

function saveMovieRating(movieId, rating, review = "") {
    const score = Number(rating);
    if (!Number.isFinite(score) || score < 1 || score > 10) return false;

    const allRatings = getAllRatings();
    const movieKey = String(movieId);
    const existing = Array.isArray(allRatings[movieKey]) ? allRatings[movieKey] : [];
    const raterId = getRaterId();
    const entry = {
        raterId,
        name: (getCurrentUser()?.name || getCurrentUser()?.username || "Guest"),
        rating: score,
        review: String(review || "").trim().slice(0, 1000),
        updatedAt: new Date().toISOString()
    };
    const index = existing.findIndex(item => item.raterId === raterId);
    if (index >= 0) existing[index] = entry;
    else existing.push(entry);
    allRatings[movieKey] = existing;
    return saveStoredData(STORAGE_KEYS.ratings, allRatings);
}

function removeMovieRelatedData(movieId) {
    saveFavorites(getFavorites().filter(id => Number(id) !== Number(movieId)));
    const allRatings = getAllRatings();
    delete allRatings[String(movieId)];
    saveStoredData(STORAGE_KEYS.ratings, allRatings);
}
