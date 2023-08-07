-- 1. show the matchid and player name for all goals scored by Germany. To identify German players, check for: teamid = 'GER'
SELECT goal.matchid, goal.player
FROM goal
JOIN eteam
ON goal.teamid = eteam.id
WHERE goal.teamid = 'GER';
