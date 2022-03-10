/*
LeetCode 620. Not Boring Movies
https://leetcode.com/problems/not-boring-movies/
*/


SELECT *
FROM Cinema
WHERE MOD(id, 2) = 1 AND description != 'boring'
ORDER BY rating DESC;