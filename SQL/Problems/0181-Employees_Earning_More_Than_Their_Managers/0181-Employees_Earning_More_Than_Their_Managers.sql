/*
LeetCode 181. Employees Earning More Than Their Managers
https://leetcode.com/problems/employees-earning-more-than-their-managers/
*/

-- Solution #01: Using a Self-Join

SELECT e1.name AS 'Employee'
FROM Employee e1
    INNER JOIN Employee e2
    on e1.managerId = e2.id
WHERE e1.salary > e2.salary;


-- Solution #02: Using EXISTS and a Correlated Subquery

SELECT name AS 'Employee'
FROM Employee e1
WHERE EXISTS (
    SELECT 1
    FROM Employee e2
    WHERE e1.managerId = e2.id AND e1.salary > e2.salary);