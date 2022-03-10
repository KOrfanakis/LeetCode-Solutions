/*
LeetCode 596. Classes More Than 5 Students
https://leetcode.com/problems/classes-more-than-5-students/
*/


-- Solution #01: Using GROUP BY + HAVING

SELECT class
FROM Courses
GROUP BY class
HAVING COUNT(DISTINCT student) >= 5;


-- Solution #02: Using a Subquerry + GROUP BY

SELECT class
FROM
    (SELECT class, COUNT(DISTINCT student) AS num_of_students
     FROM courses
     GROUP BY class) AS temp_table
WHERE num_of_students >= 5;