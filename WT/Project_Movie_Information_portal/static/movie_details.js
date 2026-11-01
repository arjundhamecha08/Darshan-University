/* MovieNest Phase 3 starter catalog: 25 searchable movies with poster artwork.
   Most posters are bundled in assets/Movies; six use TMDB's public poster image URLs. */
const moviesData = [
    {
        id: 1, title: "Inception", poster: "assets/Movies/Inception.jpg", genre: "Sci-Fi",
        year: 2010, language: "English", duration: "2h 28m", director: "Christopher Nolan",
        cast: ["Leonardo DiCaprio", "Joseph Gordon-Levitt", "Tom Hardy"], rating: 8.8,
        description: "A skilled thief enters people's dreams to steal secrets, then receives a job that requires planting an idea instead.",
        trailer: "https://www.youtube.com/results?search_query=Inception+official+trailer"
    },
    {
        id: 2, title: "Interstellar", poster: "assets/Movies/Interstellar.jpg", genre: "Sci-Fi",
        year: 2014, language: "English", duration: "2h 49m", director: "Christopher Nolan",
        cast: ["Matthew McConaughey", "Anne Hathaway", "Jessica Chastain"], rating: 8.7,
        description: "A team of explorers travels beyond this galaxy in search of a future for humanity.",
        trailer: "https://www.youtube.com/results?search_query=Interstellar+official+trailer"
    },
    {
        id: 3, title: "3 Idiots", poster: "assets/Movies/3_Idiots.jpg", genre: "Comedy",
        year: 2009, language: "Hindi", duration: "2h 50m", director: "Rajkumar Hirani",
        cast: ["Aamir Khan", "R. Madhavan", "Sharman Joshi"], rating: 8.4,
        description: "Three engineering students challenge academic pressure and discover what it means to follow their passion.",
        trailer: "https://www.youtube.com/results?search_query=3+Idiots+official+trailer"
    },
    {
        id: 4, title: "The Dark Knight", poster: "assets/Movies/The_Dark_Knight.jpg", genre: "Action",
        year: 2008, language: "English", duration: "2h 32m", director: "Christopher Nolan",
        cast: ["Christian Bale", "Heath Ledger", "Aaron Eckhart"], rating: 9.0,
        description: "Batman faces the Joker, a criminal mastermind who pushes Gotham City into chaos.",
        trailer: "https://www.youtube.com/results?search_query=The+Dark+Knight+official+trailer"
    },
    {
        id: 5, title: "Animal", poster: "assets/animal.jpg", genre: "Action",
        year: 2023, language: "Hindi", duration: "3h 21m", director: "Sandeep Reddy Vanga",
        cast: ["Ranbir Kapoor", "Anil Kapoor", "Rashmika Mandanna"], rating: 6.2,
        description: "A violent crime drama centered on a complicated father-son relationship.",
        trailer: "https://www.youtube.com/results?search_query=Animal+2023+official+trailer"
    },
    {
        id: 6, title: "Schindler's List", poster: "assets/Movies/Schindlers_List.jpg", genre: "Drama",
        year: 1993, language: "English", duration: "3h 15m", director: "Steven Spielberg",
        cast: ["Liam Neeson", "Ben Kingsley", "Ralph Fiennes"], rating: 9.0,
        description: "A German industrialist risks everything to save Jewish workers during the Holocaust.",
        trailer: "https://www.youtube.com/results?search_query=Schindlers+List+official+trailer"
    },
    {
        id: 7, title: "The Odyssey", poster: "assets/Movies/The_Odyssey.jpg", genre: "Adventure",
        year: 2026, language: "English", duration: "Not announced", director: "Christopher Nolan",
        cast: ["Matt Damon", "Tom Holland", "Anne Hathaway", "Robert Pattinson"], rating: null,
        description: "A mythic journey inspired by Homer's epic poem about Odysseus's long voyage home.",
        trailer: "https://www.youtube.com/results?search_query=The+Odyssey+2026+official+trailer"
    },
    {
        id: 8, title: "The Whisper Man", poster: "assets/Movies/The_whisper_man.jpg", genre: "Thriller",
        year: 2026, language: "English", duration: "Not announced", director: "Not listed",
        cast: [], rating: null,
        description: "A mystery thriller built around a chilling case and a disturbing whispering presence.",
        trailer: "https://www.youtube.com/results?search_query=The+Whisper+Man+official+trailer"
    },
    {
        id: 9, title: "Welcome to the Jungle", poster: "assets/Movies/Welcome_To_The_Jungle.jpg", genre: "Comedy",
        year: 2026, language: "Hindi", duration: "Not announced", director: "Ahmed Khan",
        cast: [], rating: null,
        description: "An ensemble comedy where a tangled plan sets off a chain of chaotic misunderstandings.",
        trailer: "https://www.youtube.com/results?search_query=Welcome+To+The+Jungle+Hindi+official+trailer"
    },
    {
        id: 10, title: "Bhoot Bangla", poster: "assets/Movies/Bhoot_Bangla.jpg", genre: "Horror",
        year: 2026, language: "Hindi", duration: "Not announced", director: "Priyadarshan",
        cast: ["Akshay Kumar"], rating: null,
        description: "A horror-comedy set around a mysterious house and a series of eerie, funny events.",
        trailer: "https://www.youtube.com/results?search_query=Bhoot+Bangla+official+trailer"
    },
    {
        id: 11, title: "Dhurandhar", poster: "assets/Movies/Dhurandhar.jpg", genre: "Action",
        year: 2025, language: "Hindi", duration: "Not listed", director: "Aditya Dhar",
        cast: ["Ranveer Singh"], rating: null,
        description: "An Indian action thriller centered on an undercover operation and high-stakes espionage.",
        trailer: "https://www.youtube.com/results?search_query=Dhurandhar+official+trailer"
    },
    {
        id: 12, title: "The Lord of the Rings: The Fellowship of the Ring", poster: "assets/Movies/The_Lord_of_Rings.jpg", genre: "Fantasy",
        year: 2001, language: "English", duration: "2h 58m", director: "Peter Jackson",
        cast: ["Elijah Wood", "Ian McKellen", "Viggo Mortensen"], rating: 8.8,
        description: "A young hobbit begins a dangerous quest to destroy a powerful ring and protect Middle-earth.",
        trailer: "https://www.youtube.com/results?search_query=Lord+of+the+Rings+Fellowship+official+trailer"
    },
    {
        id: 13, title: "The Dog Stars", poster: "assets/Movies/The_Dog_Star.jpg", genre: "Sci-Fi",
        year: 2026, language: "English", duration: "Not announced", director: "Ridley Scott",
        cast: [], rating: null,
        description: "A post-apocalyptic science-fiction story about survival and the search for human connection.",
        trailer: "https://www.youtube.com/results?search_query=The+Dog+Stars+2026+official+trailer"
    },
    {
        id: 14, title: "Cocktail 2", poster: "assets/Movies/Cocktail_2.jpg", genre: "Romance",
        year: 2026, language: "Hindi", duration: "Not announced", director: "Not listed",
        cast: [], rating: null,
        description: "A contemporary romantic drama following friendships, relationships, and complicated choices.",
        trailer: "https://www.youtube.com/results?search_query=Cocktail+2+official+trailer"
    },
    {
        id: 15, title: "Avengers: Endgame", poster: "assets/Movies/Avengers_Endgame.jpg", genre: "Action",
        year: 2019, language: "English", duration: "3h 1m", director: "Anthony Russo, Joe Russo",
        cast: ["Robert Downey Jr.", "Chris Evans", "Scarlett Johansson"], rating: 8.4,
        description: "The remaining Avengers assemble for one final mission after a devastating universal event.",
        trailer: "https://www.youtube.com/results?search_query=Avengers+Endgame+official+trailer"
    },
    {
        id: 16, title: "The Godfather", poster: "assets/Movies/The_God_Father.jpg", genre: "Crime",
        year: 1972, language: "English", duration: "2h 55m", director: "Francis Ford Coppola",
        cast: ["Marlon Brando", "Al Pacino", "James Caan"], rating: 9.2,
        description: "The aging patriarch of a crime family passes control to his reluctant son.",
        trailer: "https://www.youtube.com/results?search_query=The+Godfather+official+trailer"
    },
    {
        id: 17, title: "Alpha", poster: "assets/Movies/Alpha.jpg", genre: "Action",
        year: 2025, language: "Hindi", duration: "Not announced", director: "Not listed",
        cast: [], rating: null,
        description: "An action-driven thriller about a high-stakes mission and the people caught in its path.",
        trailer: "https://www.youtube.com/results?search_query=Alpha+movie+official+trailer"
    },
    {
        id: 18, title: "Dhamaal 4", poster: "assets/Movies/Dhamaal_4.jpg", genre: "Comedy",
        year: 2026, language: "Hindi", duration: "Not announced", director: "Indra Kumar",
        cast: ["Ajay Devgn", "Arshad Warsi", "Riteish Deshmukh"], rating: null,
        description: "A comedy sequel promising another chaotic adventure for an unlucky group of friends.",
        trailer: "https://www.youtube.com/results?search_query=Dhamaal+4+official+trailer"
    },
    {
        id: 19, title: "The Shawshank Redemption", poster: "assets/Movies/The_Shawshank_Redemption.jpg", genre: "Drama",
        year: 1994, language: "English", duration: "2h 22m", director: "Frank Darabont",
        cast: ["Tim Robbins", "Morgan Freeman"], rating: 9.3,
        description: "Two prisoners form a lasting friendship as one quietly hopes for a better future.",
        trailer: "https://www.youtube.com/results?search_query=The+Shawshank+Redemption+official+trailer"
    },
    {
        id: 20, title: "The Matrix", poster: "https://image.tmdb.org/t/p/w500/f89U3ADr1oiB1s9GkdPOEpXUk5H.jpg", genre: "Sci-Fi",
        year: 1999, language: "English", duration: "2h 16m", director: "Lana Wachowski, Lilly Wachowski",
        cast: ["Keanu Reeves", "Carrie-Anne Moss", "Laurence Fishburne"], rating: 8.7,
        description: "A computer hacker discovers that reality is not what it seems and joins a rebellion against machines.",
        trailer: "https://www.youtube.com/results?search_query=The+Matrix+official+trailer"
    },
    {
        id: 21, title: "Avatar", poster: "https://image.tmdb.org/t/p/w500/kyeqWdyUXW608qlYkRqosgbbJyK.jpg", genre: "Sci-Fi",
        year: 2009, language: "English", duration: "2h 42m", director: "James Cameron",
        cast: ["Sam Worthington", "Zoe Saldaña", "Sigourney Weaver"], rating: 7.9,
        description: "A former Marine becomes part of an indigenous world on Pandora and must choose where his loyalties lie.",
        trailer: "https://www.youtube.com/results?search_query=Avatar+2009+official+trailer"
    },
    {
        id: 22, title: "Oppenheimer", poster: "https://image.tmdb.org/t/p/w500/ptpr0kGAckfQkJeJIt8st5dglvd.jpg", genre: "Drama",
        year: 2023, language: "English", duration: "3h", director: "Christopher Nolan",
        cast: ["Cillian Murphy", "Emily Blunt", "Robert Downey Jr."], rating: 8.3,
        description: "The story of J. Robert Oppenheimer and the scientific effort that led to the atomic bomb.",
        trailer: "https://www.youtube.com/results?search_query=Oppenheimer+official+trailer"
    },
    {
        id: 23, title: "Titanic", poster: "https://image.tmdb.org/t/p/w500/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg", genre: "Romance",
        year: 1997, language: "English", duration: "3h 14m", director: "James Cameron",
        cast: ["Leonardo DiCaprio", "Kate Winslet", "Billy Zane"], rating: 7.9,
        description: "A romance unfolds aboard the RMS Titanic as the ocean liner approaches its tragic fate.",
        trailer: "https://www.youtube.com/results?search_query=Titanic+1997+official+trailer"
    },
    {
        id: 24, title: "Parasite", poster: "https://image.tmdb.org/t/p/w500/7IiTTgloJzvGI1TAYymCfbfl3vT.jpg", genre: "Thriller",
        year: 2019, language: "Korean", duration: "2h 12m", director: "Bong Joon-ho",
        cast: ["Song Kang-ho", "Lee Sun-kyun", "Cho Yeo-jeong"], rating: 8.5,
        description: "A poor family gradually becomes entangled with a wealthy household, with unexpected consequences.",
        trailer: "https://www.youtube.com/results?search_query=Parasite+2019+official+trailer"
    },
    {
        id: 25, title: "Fight Club", poster: "https://image.tmdb.org/t/p/w500/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg", genre: "Drama",
        year: 1999, language: "English", duration: "2h 19m", director: "David Fincher",
        cast: ["Brad Pitt", "Edward Norton", "Helena Bonham Carter"], rating: 8.8,
        description: "An insomniac office worker and a charismatic stranger form an underground fight club.",
        trailer: "https://www.youtube.com/results?search_query=Fight+Club+official+trailer"
    }
];
