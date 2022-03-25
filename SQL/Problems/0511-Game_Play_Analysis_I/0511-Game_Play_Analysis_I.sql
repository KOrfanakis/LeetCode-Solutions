/*
LeetCode 511. Game Play Analysis I
https://leetcode.com/problems/game-play-analysis-i/
*/


-- Solution #01: Using GROUP BY

SELECT player_id, MIN(event_date) AS 'first_login'
FROM Activity
GROUP BY player_id
ORDER BY player_id ASC;


-- Solution #02: Using a Subquery

SELECT player_id, event_date AS 'first_login'
FROM Activity A1
WHERE event_date = (
    SELECT MIN(event_date)
    FROM Activity A2
    WHERE A2.player_id = A1.player_id);