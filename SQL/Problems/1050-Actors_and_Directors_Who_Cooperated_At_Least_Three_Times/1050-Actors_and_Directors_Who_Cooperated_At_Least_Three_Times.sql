/*
LeetCode 1050. Actors and Directors Who Cooperated At Least Three Times
https://leetcode.com/problems/actors-and-directors-who-cooperated-at-least-three-times/
*/


-- Solution #01: Using GROUP BY + HAVING:

SELECT actor_id, director_id
FROM ActorDirector
GROUP BY actor_id, director_id
HAVING COUNT(*) >= 3;


-- Solution #02: Using PARTITION BY:

SELECT DISTINCT(actor_id), director_id
FROM (
    SELECT
        actor_id,
        director_id,
        COUNT(timestamp) OVER (PARTITION BY actor_id, director_id) AS num
    FROM ActorDirector) AS temp
WHERE num >= 3;


-- Alternatively, we can rewrite the previous solution using a CTE:

WITH cte AS (
    SELECT
        actor_id,
        director_id,
        COUNT(timestamp) OVER (PARTITION BY actor_id, director_id) AS num
    FROM ActorDirector)
    
SELECT DISTINCT(actor_id), director_id
FROM cte
WHERE num >= 3;