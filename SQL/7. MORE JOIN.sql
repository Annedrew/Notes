-- 1. List the films where the yr is 1962 [Show id, title]
SELECT id, title
FROM movie
WHERE yr=1962

-- 2. Give year of 'Citizen Kane'
SELECT yr
FROM movie
WHERE title = 'Citizen Kane'

-- 3. List all of the Star Trek movies, include the id, title and yr (all of these movies include the words Star Trek in the title). Order results by year.
-- (The percent sign is a wildcard character in SQL that represents zero, one, or multiple characters.)
SELECT id, title, yr
FROM movie
WHERE title LIKE '%Star Trek%'
ORDER BY yr

-- 4. What id number does the actor 'Glenn Close' have?
SELECT actor.id
FROM movie
JOIN actor ON (movie.id = actor.id)
WHERE actor.name = 'Glenn Close'

-- 5. What is the id of the film 'Casablanca'
SELECT id 
FROM movie
WHERE title = 'Casablanca'

-- ** 6. 
-- Cast List：演员名单
SELECT name
FROM actor
WHERE actor.id IN (SELECT actorid FROM casting JOIN movie ON (casting.movieid = movie.id) WHERE title = 'Casablanca')

-- 7. Obtain the cast list for the film 'Alien'
SELECT name
FROM actor
WHERE actor.id IN (SELECT actorid FROM casting JOIN movie ON (movie.id = casting.movieid) WHERE movie.title = 'Alien')

-- 8. List the films in which 'Harrison Ford' has appeared
SELECT title FROM movie WHERE id IN (SELECT movieid FROM casting WHERE actorid = (SELECT id FROM actor WHERE name = 'Harrison Ford'))

-- 9. List the films where 'Harrison Ford' has appeared - but not in the starring role. [Note: the ord field of casting gives the position of the actor. If ord=1 then this actor is in the starring role]
-- starring role：主演
SELECT title
FROM movie
WHERE id IN (SELECT movieid FROM casting WHERE actorid = (SELECT actor.id FROM actor WHERE actor.name = 'Harrison Ford') AND ord != 1)

-- ** 10. List the films together with the leading star for all 1962 films
SELECT title, name
FROM movie
JOIN casting ON (movie.id = casting.movieid)
JOIN actor ON (casting.actorid = actor.id)
WHERE movie.yr = 1962 AND casting.ord = 1

-- ** 11. Which were the busiest years for 'Rock Hudson', show the year and the number of movies he made each year for any year in which he made more than 2 movies.
SELECT yr,COUNT(title) 
FROM movie 
JOIN casting ON movie.id = casting.movieid
JOIN actor ON casting.actorid = actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 1

-- 12. List the film title and the leading actor for all of the films 'Julie Andrews' played in
-- We can join the tables when it has a many-to-many relationship. (eg: an actor can act in many movies, and a movie can have many actors)
-- 1. Find the id of 'Julie Andrews'
-- 2. Find the movies 'Julie Andrews' acted in
-- 3. Find  the ord = 1
SELECT title, name
FROM movie
JOIN casting ON (movie.id = casting.movieid AND ord = 1)
JOIN actor ON casting.actorid = actor.id
WHERE movie.id IN (SELECT casting.movieid 
                    FROM casting WHERE actorid IN (SELECT actor.id 
                                                    FROM actor WHERE actor.name = 'Julie Andrews'))

-- 13. Obtain a list, in alphabetical order, of actors who've had at least 15 starring roles
SELECT name
FROM actor
WHERE id IN (
    SELECT actorid
    FROM casting
    WHERE ord = 1
    GROUP BY actorid
    HAVING COUNT(movieid) >= 15
)

-- 14. List the films released in the year 1978 ordered by the number of actors in the cast, then by title
-- WRONG --
SELECT title
FROM movie
WHERE yr = 1978
ORDER BY (SELECT COUNT(actorid) FROM casting GROUP BY movieid), title
-- WRONG --

-- RIGHT --
SELECT title, COUNT(actorid)
FROM movie
LEFT JOIN casting ON movie.id = casting.movieid
WHERE yr = 1978
GROUP BY title, id
ORDER BY COUNT(actorid) DESC, title;
-- RIGHT --

-- 15. List all the people who have worked with 'Art Garfunkel'
SELECT name FROM actor 
JOIN casting ON (casting.actorid = actor.id)
WHERE movieid IN (SELECT movieid FROM casting WHERE actorid = (SELECT id FROM actor WHERE name = 'Art Garfunkel')) AND name != 'Art Garfunkel'
ORDER BY name

-- QUIZ: 1. Select the statement which lists the unfortunate directors of the movies which have caused financial loses (gross < budget)
SELECT name
  FROM actor INNER JOIN movie ON actor.id = director
 WHERE gross < budget