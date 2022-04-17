/*
LeetCode 1148. Article Views I
https://leetcode.com/problems/article-views-i/
*/


-- Solution #01: Using the WHERE Clause + DISTINCT

SELECT DISTINCT(author_id) AS 'id'
FROM Views
WHERE author_id = viewer_id
ORDER BY id ASC;


-- Solution #02: Using the WHERE Clause + GROUP BY

SELECT author_id AS id 
FROM Views 
WHERE author_id = viewer_id
GROUP BY id
ORDER BY id ASC;