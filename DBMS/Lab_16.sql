--Part – A: 
--1. Display players who belong to teams located in ‘Mumbai’. 
select p.player_first_name,p.player_last_name , t.team_name from player p
inner join team t on p.team_id = t.team_id
inner join stadium s on t.HOME_STADIUM_ID = s.Stadium_id
where s.Stadium_city = 'mumbai'

--2. Display all teams and players. 
select p.player_first_name,p.player_last_name , t.team_name from team t
left join player p on p.team_id = t.team_id


--3. Display players along with team wins and stadium city.
select p.player_first_name,p.player_last_name,t.team_name,t.team_wins,s.Stadium_city from PLAYER p
inner join team t on p.TEAM_ID = t.TEAM_ID
inner join STADIUM s on s.Stadium_id = t.HOME_STADIUM_ID
order by s.Stadium_city

--4. Display team name and number of players in each team. 
select t.team_name,count(*) from team t 
inner join PLAYER p on p.TEAM_ID=t.TEAM_ID
group by t.TEAM_NAME

--5. Display team name, coach, and number of bowlers in each team. 
select t.team_name,t.TEAM_COACH,COUNT(*) as number_of_bowlers from team t 
inner join PLAYER p on p.TEAM_ID = t.TEAM_ID
group by t.TEAM_NAME

--6. Display team name with count of batsmen, bowlers, and all-rounders.

--7. Display stadiums where teams have won more than 10 matches. 
select s.Stadium_name, t.TEAM_WINS from STADIUM s 
left join team t on s.Stadium_id = t.HOME_STADIUM_ID
where t.team_wins>10

--8. Display team name and number of players whose matches played is greater than 25. 
select t.TEAM_NAME,count(*) from TEAM t
left join player p on p.TEAM_ID = t.TEAM_ID 
where p.PLAYER_MATCHES_PLAYED>25
group by t.TEAM_NAME

--9. Display team name and total number of players having jersey number greater than 30. 
select t.TEAM_NAME,count(*) from TEAM t
left join player p on p.TEAM_ID = t.TEAM_ID 
where p.PLAYER_JERSEY_NUMBER>30
group by t.TEAM_NAME

--10. Display team name and total matches played by its players. 
select t.TEAM_NAME,sum(PLAYER_MATCHES_PLAYED) from TEAM t
left join PLAYER p on p.TEAM_ID = t.TEAM_ID
group by t.TEAM_NAME

-- Part – B:
-- 11. Display stadium city and total number of teams in each city.
SELECT S.Stadium_city, COUNT(T.TEAM_ID) AS TeamsCount
FROM STADIUM S
LEFT JOIN TEAM T ON T.HOME_STADIUM_ID = S.Stadium_id
GROUP BY S.Stadium_city;

-- 12. Display team name and average matches played by players in each team.
SELECT T.TEAM_NAME, AVG(CAST(P.PLAYER_MATCHES_PLAYED AS FLOAT)) AS AvgMatchesPlayed
FROM TEAM T
LEFT JOIN PLAYER P ON T.TEAM_ID = P.TEAM_ID
GROUP BY T.TEAM_NAME;

-- 13. Display team name and maximum matches played by any player in each team.
SELECT T.TEAM_NAME, MAX(P.PLAYER_MATCHES_PLAYED) AS MaxMatchesPlayed
FROM TEAM T
LEFT JOIN PLAYER P ON T.TEAM_ID = P.TEAM_ID
GROUP BY T.TEAM_NAME;

-- 14. Display team name and minimum matches played by any player in each team.
SELECT T.TEAM_NAME, MIN(P.PLAYER_MATCHES_PLAYED) AS MinMatchesPlayed
FROM TEAM T
LEFT JOIN PLAYER P ON T.TEAM_ID = P.TEAM_ID
GROUP BY T.TEAM_NAME;

-- 15. Display stadium name and total number of players playing under teams of that stadium.
SELECT S.Stadium_name, COUNT(P.PLAYER_ID) AS TotalPlayers
FROM STADIUM S
LEFT JOIN TEAM T ON T.HOME_STADIUM_ID = S.Stadium_id
LEFT JOIN PLAYER P ON P.TEAM_ID = T.TEAM_ID
GROUP BY S.Stadium_name;

-- Part – C:
-- 16. Display teams having more all-rounders than bowlers.
SELECT T.TEAM_NAME
FROM TEAM T
LEFT JOIN PLAYER P ON T.TEAM_ID = P.TEAM_ID
GROUP BY T.TEAM_NAME
HAVING SUM(CASE WHEN UPPER(P.PLAYER_ROLE) LIKE '%ALL-ROUND%' OR UPPER(P.PLAYER_ROLE) = 'ALL-ROUNDER' THEN 1 ELSE 0 END) 
     > SUM(CASE WHEN UPPER(P.PLAYER_ROLE) = 'BOWLER' THEN 1 ELSE 0 END);

-- 17. Display teams where difference between max and min player matches is greater than 5.
SELECT T.TEAM_NAME,
       COALESCE(MAX(P.PLAYER_MATCHES_PLAYED),0) - COALESCE(MIN(P.PLAYER_MATCHES_PLAYED),0) AS MatchesDiff
FROM TEAM T
LEFT JOIN PLAYER P ON T.TEAM_ID = P.TEAM_ID
GROUP BY T.TEAM_NAME
HAVING COALESCE(MAX(P.PLAYER_MATCHES_PLAYED),0) - COALESCE(MIN(P.PLAYER_MATCHES_PLAYED),0) > 5;

-- 18. Display stadium city and total wins of teams in that city.
SELECT S.Stadium_city, COALESCE(SUM(T.TEAM_WINS),0) AS TotalWins
FROM STADIUM S
LEFT JOIN TEAM T ON T.HOME_STADIUM_ID = S.Stadium_id
GROUP BY S.Stadium_city;

-- 19. Display team name and total number of players for each role (grouped by role).
SELECT T.TEAM_NAME, COALESCE(P.PLAYER_ROLE,'Unknown') AS PLAYER_ROLE, COUNT(P.PLAYER_ID) AS RoleCount
FROM TEAM T
LEFT JOIN PLAYER P ON T.TEAM_ID = P.TEAM_ID
GROUP BY T.TEAM_NAME, COALESCE(P.PLAYER_ROLE,'Unknown')
ORDER BY T.TEAM_NAME, PLAYER_ROLE;

-- 20. Display team name and total number of players whose name starts with 'A'
SELECT T.TEAM_NAME,
       SUM(CASE WHEN UPPER(P.PLAYER_FIRST_NAME) LIKE 'A%' THEN 1 ELSE 0 END) AS PlayersStartingWithA
FROM TEAM T
LEFT JOIN PLAYER P ON T.TEAM_ID = P.TEAM_ID
GROUP BY T.TEAM_NAME;

select * from PLAYER
select * from team
select * from STADIUM