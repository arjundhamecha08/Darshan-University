//Theme Button
let themeImg = document.getElementById("theme-img");
theme.addEventListener("click", function () {
    if (themeImg.src.includes("sun.png")) {
        themeImg.src = "assets/moon.png";
    } else {
        themeImg.src = "assets/sun.png";
    }
});


// HighRated_Movie

let HighRated = document.getElementById("high-rated");
let HighRated_Movies = 
['The_Shawshank_Redemption.jpg',
    'The_God_Father.jpg',
    'The_Dark_Knight.jpg',
    'The_Lord_of_Rings.jpg',
    'Schindlers_List.jpg'];


for (let i = 0; i < HighRated_Movies.length; i++) {
    let movies = document.createElement("div");
    let images = document.createElement("img");
    movies.classList.add("top");
    images.src = `assets/High_Rated_Movies/${HighRated_Movies[i]}`;
    movies.appendChild(images);
    
HighRated.appendChild(movies);
}

//Top Trending Movie

let TopTrending = document.getElementById("trending");
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

for (let i = 0; i < TopTrending_Movies.length; i++) {
    let movies = document.createElement("div");
    let images = document.createElement("img");
    movies.classList.add("top");
    images.src = `assets/Top_Trending_Movies/${TopTrending_Movies[i]}`;
    movies.appendChild(images);
    TopTrending.appendChild(movies);
}