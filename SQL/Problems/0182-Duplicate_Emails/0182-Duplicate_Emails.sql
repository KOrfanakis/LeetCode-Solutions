/*
LeetCode 182. Duplicate Emails
https://leetcode.com/problems/duplicate-emails/
*/


-- Solution #01: Using GROUP BY:

SELECT email AS 'Email'
FROM Person
GROUP BY email
HAVING COUNT(email) > 1;


-- Solution #02: Using a Self Join

SELECT DISTINCT p1.email AS 'Email'
FROM Person p1, Person p2
WHERE p1.email = p2.email AND p1.id != p2.id;


-- Solution #03: Using a Temporary Table

SELECT email AS 'Email'
FROM (
    SELECT email, COUNT(*) AS num
    FROM Person
    GROUP BY email
) AS groupby
WHERE num > 1;