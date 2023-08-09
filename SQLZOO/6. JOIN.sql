-- 1. Show the matchid and player name for all goals scored by Germany. To identify German players, check for: teamid = 'GER'
SELECT goal.matchid, goal.player
FROM goal
JOIN eteam
ON goal.teamid = eteam.id
WHERE goal.teamid = 'GER';

-- 2. From the previous query you can see that Lars Bender's scored a goal in game 1012. Now we want to know what teams were playing in that match
SELECT id, stadium, team1, team2
FROM game
JOIN goal
ON game.id = goal.matchid
WHERE game.id = 1012 AND goal.player = 'Lars Bender'

-- 3. Show the player, teamid, stadium and mdate for every German goal.
SELECT player, teamid, stadium, mdate
FROM game JOIN goal ON (id=matchid) WHERE goal.teamid = 'GER'

-- 4. Show the team1, team2 and player for every goal scored by a player called Mario player LIKE 'Mario%'
SELECT team1, team2, player
FROM game
JOIN goal
ON (id = matchid)
WHERE goal.player LIKE 'Mario%'

-- 5. Show player, teamid, coach, gtime for all goals scored in the first 10 minutes gtime<=10
SELECT goal.player, goal.teamid, eteam.coach, goal.gtime
FROM goal 
JOIN eteam
ON (teamid = id)
WHERE goal.gtime<=

-- 6. List the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach.
SELECT game.mdate, eteam.teamname
FROM game
JOIN eteam
ON (game.team1 = eteam.id)
WHERE eteam.coach = 'Fernando Santos'

-- 7. List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'
SELECT player
FROM goal
JOIN game
ON (goal.matchid = game.id)
WHERE stadium = 'National Stadium, Warsaw'

-- ** 8. Show the name of all players who scored a goal against Germany
SELECT DISTINCT player
FROM goal
JOIN game ON matchid = id
WHERE 
    (team1 = 'GER' AND teamid != 'GER')
    OR 
    (team2 = 'GER' AND teamid != 'GER');

-- 9. Show teamname and the total number of goals scored. COUNT and GROUP BY
SELECT teamname, COUNT(*)
FROM eteam 
JOIN goal ON id=teamid
GROUP BY teamname

-- 10. Show the stadium and the number of goals scored in each stadium.
SELECT stadium, COUNT(*)
FROM game
JOIN goal ON (id = matchid)
GROUP BY stadium

-- ** 11. For every match involving 'POL', show the matchid, date and the number of goals scored.
-- Multiple GROUP BY
SELECT matchid, mdate, COUNT(matchid)
FROM game 
JOIN goal ON (id = matchid)
WHERE team1 = 'POL' OR team2 = 'POL'
GROUP BY id, matchid, mdate
ORDER BY mdate, id

-- 12. For every match where 'GER' scored, show matchid, match date and the number of goals scored by 'GER'
SELECT matchid, mdate, COUNT(matchid)
FROM goal
JOIN game ON (matchid = id)
WHERE teamid = 'GER'
GROUP BY mdate, matchid

-- ** 13. List every match with the goals scored by each team as shown. This will use "CASE WHEN" which has not been explained in any previous exercises.
-- (It is better to assign the table name to a field.)
SELECT 
    game.mdate, 
    game.team1, 
    SUM(CASE WHEN goal.teamid = game.team1 THEN 1 ELSE 0 END) AS score1,
    game.team2, 
    SUM(CASE WHEN goal.teamid = game.team2 THEN 1 ELSE 0 END) AS score2
FROM game 
LEFT JOIN goal ON game.id = goal.matchid
GROUP BY game.mdate, game.team1, game.team2;

