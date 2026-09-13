//Theme Button
document.addEventListener("DOMContentLoaded", () => {
    let themeImg = document.getElementById("theme-img");

    // Check if the element exists before adding the listener
    if (themeImg) {
        themeImg.addEventListener("click", function () {
            themeImg.src = themeImg.src.includes("sun.png") ? "assets/moon.png" : "assets/sun.png";
        });
    }
});

function renderMovies(containerId, movieNames, folderName) {
    let container = document.getElementById(containerId);

    if (!container) {
        return;
    }

    for (let movieName of movieNames) {
        let movie = document.createElement("div");
        let image = document.createElement("img");
        movie.classList.add("top");
        image.src = `assets/${folderName}/${movieName}`;
        movie.appendChild(image);
        container.appendChild(movie);
    }
}

// HighRated_Movie

let HighRated_Movies = 
['The_Shawshank_Redemption.jpg',
    'The_God_Father.jpg',
    'The_Dark_Knight.jpg',
    'The_Lord_of_Rings.jpg',
    'Schindlers_List.jpg'];


renderMovies("high-rated", HighRated_Movies, "High_Rated_Movies");

let Featured_Movies = 
[
    'Inception.jpg',
    'Interstellar.jpg',
    'The_Dark_Knight.jpg',
    'The_Shawshank_Redemption.jpg',
    'Avengers_Endgame.jpg',
    '3_Idiots.jpg'
];
renderMovies("featured", Featured_Movies, "Featured_Movies");


//Top Trending Movie

let TopTrending_Movies =
[
    'Dhurandhar.jpg',
    'Dhamaal_4.jpg',
    'Welcome_To_The_Jungle.jpg',
    'Bhoot_Bangla.jpg',
    'Cocktail_2.jpg',
    'Alpha.jpg',
    'The_Dog_Star.jpg',
    'The_Odyssey.jpg',
    'The_whisper_man.jpg',
];

renderMovies("trending", TopTrending_Movies, "Top_Trending_Movies");

//Fav-Movies
let Fev_Movies = 
[
    'animal.jpg'
];
renderMovies("fev-movies", Fev_Movies, "Fev_Movies");

//Movies
let Movies = TopTrending_Movies.concat(Featured_Movies).concat(HighRated_Movies)
renderMovies("Movies", Movies, "Movies");