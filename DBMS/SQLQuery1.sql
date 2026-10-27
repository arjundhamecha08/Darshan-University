/* =========================================================
   LAB 15 – ADVANCED SQL JOINS (LEVEL-1)
   PART-A : Q1 TO Q10
   ========================================================= */

/* 1. List all books with their authors */
SELECT B.BookName, A.AuthorName
FROM BOOK B
JOIN AUTHOR A
ON B.AuthorID = A.AuthorID;


/* 2. List all books with their publishers */
SELECT B.BookName, P.PublisherName
FROM BOOK B
JOIN PUBLISHER P
ON B.PublisherID = P.PublisherID;


/* 3. List all books with their authors and publishers */
SELECT B.BookName, A.AuthorName, P.PublisherName
FROM BOOK B
JOIN AUTHOR A
ON B.AuthorID = A.AuthorID
JOIN PUBLISHER P
ON B.PublisherID = P.PublisherID;


/* 4. List all books published after 2010 with
      their authors, publisher and price */
SELECT B.BookName, A.AuthorName, P.PublisherName, B.Price
FROM BOOK B
JOIN AUTHOR A
ON B.AuthorID = A.AuthorID
JOIN PUBLISHER P
ON B.PublisherID = P.PublisherID
WHERE B.PublishedYear > 2010;


/* 5. List all authors and the number of books they have written */
SELECT A.AuthorName, COUNT(B.BookID) AS NumberOfBooks
FROM AUTHOR A
LEFT JOIN BOOK B
ON A.AuthorID = B.AuthorID
GROUP BY  A.AuthorName;


/* 6. List all publishers and the total price of books
      they have published */
SELECT P.PublisherName, SUM(B.Price) AS TotalPrice
FROM PUBLISHER P
LEFT JOIN BOOK B
ON P.PublisherID = B.PublisherID
GROUP BY P.PublisherID, P.PublisherName;


/* 7. List authors who have not written any books */
SELECT A.AuthorName
FROM AUTHOR A
LEFT JOIN BOOK B
ON A.AuthorID = B.AuthorID
WHERE B.BookID IS NULL;


/* 8. Display total number of books written by each author
      along with average price */
SELECT A.AuthorName,
       COUNT(B.BookID) AS TotalBooks,
       AVG(B.Price) AS AveragePrice
FROM AUTHOR A
LEFT JOIN BOOK B
ON A.AuthorID = B.AuthorID
GROUP BY A.AuthorID, A.AuthorName;


/* 9. List each publisher with total number of books,
      sorted from highest to lowest */
SELECT P.PublisherName,
       COUNT(B.BookID) AS TotalBooks
FROM PUBLISHER P
LEFT JOIN BOOK B
ON P.PublisherID = B.PublisherID
GROUP BY P.PublisherID, P.PublisherName
ORDER BY TotalBooks DESC;


/* 10. Display number of books published each year */
SELECT PublishedYear, COUNT(*) AS NumberOfBooks
FROM BOOK
GROUP BY PublishedYear
ORDER BY PublishedYear;


/* =========================================================
   LAB 16 – ADVANCED SQL JOINS (LEVEL-2)
   PART-A : Q1 TO Q10
   ========================================================= */

/* 1. Display players who belong to teams located in Mumbai */
SELECT P.PlayerName, T.TeamName
FROM PLAYER P
JOIN TEAM T
ON P.TeamID = T.TeamID
JOIN STADIUM S
ON T.StadiumID = S.StadiumID
WHERE S.City = 'Mumbai';


/* 2. Display all teams and players */
SELECT T.TeamName, P.PlayerName
FROM TEAM T
LEFT JOIN PLAYER P
ON T.TeamID = P.TeamID;


/* 3. Display players along with team wins and stadium city */
SELECT P.PlayerName, T.TeamName, T.Wins, S.City
FROM PLAYER P
JOIN TEAM T
ON P.TeamID = T.TeamID
JOIN STADIUM S
ON T.StadiumID = S.StadiumID;


/* 4. Display team name and number of players in each team */
SELECT T.TeamName, COUNT(P.PlayerID) AS NumberOfPlayers
FROM TEAM T
LEFT JOIN PLAYER P
ON T.TeamID = P.TeamID
GROUP BY T.TeamID, T.TeamName;


/* 5. Display team name, coach and number of bowlers */
SELECT T.TeamName, T.Coach,
       COUNT(P.PlayerID) AS NumberOfBowlers
FROM TEAM T
LEFT JOIN PLAYER P
ON T.TeamID = P.TeamID
AND P.Role = 'Bowler'
GROUP BY T.TeamID, T.TeamName, T.Coach;


/* 6. Display team name with count of batsmen,
      bowlers and all-rounders */
SELECT T.TeamName,
       SUM(CASE WHEN P.Role = 'Batsman' THEN 1 ELSE 0 END) AS Batsmen,
       SUM(CASE WHEN P.Role = 'Bowler' THEN 1 ELSE 0 END) AS Bowlers,
       SUM(CASE WHEN P.Role = 'All-Rounder' THEN 1 ELSE 0 END) AS AllRounders
FROM TEAM T
LEFT JOIN PLAYER P
ON T.TeamID = P.TeamID
GROUP BY T.TeamID, T.TeamName;


/* 7. Display stadiums where teams have won more than 10 matches */
SELECT S.StadiumName, S.City, T.TeamName, T.Wins
FROM STADIUM S
JOIN TEAM T
ON S.StadiumID = T.StadiumID
WHERE T.Wins > 10;


/* 8. Display team name and number of players
      whose matches played is greater than 25 */
SELECT T.TeamName, COUNT(P.PlayerID) AS NumberOfPlayers
FROM TEAM T
JOIN PLAYER P
ON T.TeamID = P.TeamID
WHERE P.Matches > 25
GROUP BY T.TeamID, T.TeamName;


/* 9. Display team name and total number of players
      having jersey number greater than 30 */
SELECT T.TeamName, COUNT(P.PlayerID) AS TotalPlayers
FROM TEAM T
JOIN PLAYER P
ON T.TeamID = P.TeamID
WHERE P.JerseyNo > 30
GROUP BY T.TeamID, T.TeamName;


/* 10. Display team name and total matches played
       by its players */
SELECT T.TeamName, SUM(P.Matches) AS TotalMatches
FROM TEAM T
JOIN PLAYER P
ON T.TeamID = P.TeamID
GROUP BY T.TeamID, T.TeamName;

