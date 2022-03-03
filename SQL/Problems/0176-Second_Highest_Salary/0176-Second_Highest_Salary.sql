/*
LeetCode 176. Second Highest Salary
https://leetcode.com/problems/second-highest-salary/
*/


-- Solution #01: Using a Noncorrelated Subquery

SELECT MAX(salary) AS 'SecondHighestSalary'
FROM Employee
WHERE salary < (SELECT MAX(salary) FROM Employee);


-- Solution #02: Using a Correlated Subquery


SELECT
    IFNULL(
        (SELECT DISTINCT(salary)
         FROM Employee e1
         WHERE 1 = (SELECT COUNT(*)
                    FROM Employee e2
                    WHERE e2.salary > e1.salary)),
        Null
    ) AS 'SecondHighestSalary';


-- Solution #03: Using LIMIT + OFFSET

SELECT
    IFNULL(
        (SELECT DISTINCT(salary)
         FROM Employee
         ORDER BY salary DESC
         LIMIT 1 OFFSET 1),
        NULL
    ) AS 'SecondHighestSalary';